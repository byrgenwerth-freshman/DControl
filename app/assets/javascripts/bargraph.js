//bargraph.js
//Taken from: http://bl.ocks.org/mbostock/3885705
//Modified: Matt Owens
//
//Description: This file is the JavaScript that controls the bargraph
/*************************************************************************************/

$(document).ready(function(){
	//Get command on the bargraph controller function index
	var object = [];
	var compItem;
	//Initialization Data Page
	$.get("/d_control/bargraph", function(msg){
		//Taking the results (JSON) of get command and putting into a var
		var data = msg;
		var tmpArray = [];
		console.log(data);

		//Get unique Groupings from array
		for(var i = 0; i < data.length; i++){
		    if(data[i].datacenter_id == null){
			tmpArray.push(data[i].host_id);
		    }
		    else{
			tmpArray.push(data[i].datacenter_id);
		    }
		}
		
		tmpArray = getUnique(tmpArray);
		
		
		$("select[id='Groupings']").append('<option value="orig">'
						   + 'All Selected Data</option>');
		
		for(var i = 0; i < tmpArray.length; i++){
		    $("select[id='Groupings']").append('<option value="'
						       + tmpArray[i]
						       +'">' 
						       + tmpArray[i] 
						       + "</option>");
		}

		//Get unique dates
		tmpArray = [];
		
		for(var i = 0; i < data.length; i++){
                    tmpArray.push(data[i].gathered);
                }
			
		tmpArray = getUnique(tmpArray);
		
		$("select[id='Dates']").append('<option value="orig">'
					       + 'Select All Dates</option>');
		
		for(var i = 0; i < tmpArray.length; i++){
		    $("select[id='Dates']").append('<option value="'
						   + tmpArray[i]
						   + '">' 
						   + tmpArray[i] + "</option>");
                }
		
		//Convert the data from the controller
		//Should be mobed to controller
		for (var i = 0; i < data.length; i++){
		    var tmp = {};
		    for(var key in data[i]){
			compItem = key;
			if (compItem == "dns_name"){
			    tmp.dns_name = data[i][key];
			    object.push(tmp);
			}
			else if(compItem == "datacenter_id" || compItem == "host_id"){
			    tmp.group = data[i][key];
			    object.push(tmp);
			}
			else if(compItem == "gathered"){
			    tmp.gathered = data[i][key];
			    object.push(tmp);
			}
			else if(compItem == "destination_ip" || compItem == "source_ip" ){
			    tmp.dns_name = (data[i].destination_ip 
					    + " - " + data[i].source_ip);
			    object.push(tmp);
			}
			else if(data[i].hasOwnProperty(key)){
			    tmp.data = data[i][key];
			    object.push(tmp);
			}
		    }
		}	
		//Set up graph
		console.log(object);
		makeGraph(object, compItem);
	    }, "json");

	//When Grouping Changes
	var groupings = "orig";
	$("select[id='Groupings']").change(function(){
		groupings = $(this).val();
		console.log(groupings);
		var specObj = createSpecObj(groupings, dates, object);
		$("svg").remove();
		makeGraph(specObj, compItem);
	    });


	//When date changes
	var dates = "orig";
	$("select[id='Dates']").change(function(){
		dates = $(this).val();
		console.log(dates);
		var specObj = createSpecObj(groupings, dates, object);
		$("svg").remove();
		makeGraph(specObj, compItem);  
            });



    });

/*************************************************************************************/
//Functions
//Pre:
//Post:
function makeGraph(object, compItem)
{
    console.log(object);
    var margin = {top: 20, right: 20, bottom: 200, left: 40},
	width = 800 - margin.left - margin.right,
	    height = 650 - margin.top - margin.bottom;
	
	var x = d3.scale.ordinal()
	    .rangeRoundBands([0, width], .1);
	
	var y = d3.scale.linear()
	    .range([height, 0]);
	
	var xAxis = d3.svg.axis()
	    .scale(x)
	    .orient("bottom");
	
	var yAxis = d3.svg.axis()
	    .scale(y)
	    .orient("left");
	
	var svg = d3.select("#chart").append("svg")
	    .attr("width", width + margin.left + margin.right)
	    .attr("height", height + margin.top + margin.bottom)
	    .append("g")
	    .attr("transform",
		  "translate(" + margin.left + "," + margin.top + ")");

	
	x.domain(object.map(function(d) {return d.dns_name + "\n" + d.gathered } ));
	//Needs to be changed so that it will scale with the data
	y.domain([0, d3.max(object, function(d){ return d.data;})]);
	//The x-axis                                         
	svg.append("g")
	    .attr("class", "x axis")
	    .attr("transform", "translate(0," + height + ")")
	    .call(xAxis)
	    .selectAll("text")
	    .style("text-anchor", "start")
	    //This .attr is this way so the text will fit and be slanted 
	    .attr("transform", "rotate(75,1,12)");
	//The y-axis
	svg.append("g")
	    .attr("class", "y axis")
	    .call(yAxis)
	    .append("text")
	    .attr("transform", "rotate(-90)")
	    .attr("y", 6)
	    .attr("dy", ".71em")
	    .style("text-anchor", "end")
	    //This needs to be the name of whatever is being passed to the  
	    //graph                   
	    .text(compItem);
	
	//The bars
	svg.selectAll(".bar")
	    .data(object)
	    .enter().append("rect")
	    .attr("class", "bar")
	    //This needs to return the dns_name or ip_address
	    .attr("x", function(object) { return x(object.dns_name + object.gathered ); })
	    .attr("width", x.rangeBand())
	    .attr("y", function(object) { return y(object.data); })
	    .attr("height",  function(object) { return height - y(object.data); });

	d3.select("input").on("change", change);

	var sortTimeout = setTimeout(function() {
		d3.select("input").property("checked", true).each(change);
	    }, 2000);


	function change() {
	    clearTimeout(sortTimeout);

	    // Copy-on-write since tweens are evaluated after a delay.
	    var x0 = x.domain(object.sort(this.checked
					? function(a, b) { return b.data - a.data; }
					: function(a, b) { return d3.ascending(a.dns_name + a.gathered,
									       b.dns_name + b.gathered); })
			      .map(function(d) { return d.dns_name + d.gathered; }))
		.copy();

	    var transition = svg.transition().duration(300),
		delay = function(d, i) { return i * 20; };

	    transition.selectAll(".bar")
		.delay(delay)
		.attr("x", function(d) { return x0(d.dns_name + d.gathered); });

	    transition.select(".x.axis")
		.call(xAxis)
		.selectAll("g")
		.delay(delay)
		.selectAll("text")
		.style("text-anchor", "start")
		.attr("transform", "rotate(75,1,12)");

	}
}

function getUnique(array){
    var unique = array.filter(function(itm, i, a){
	    return i == a.indexOf(itm);
	});

    return unique;

}

function createSpecObj(group, date, object){
    specObj = [];
    if(group == "orig" && date == "orig"){
	specObj = object;
    }
    else if(group == "orig" && date != "orig"){
	for(var i = 0; i < object.length; i++){
            if(object[i].gathered == date){
                specObj.push(object[i]);
            }
        }
    }
    else if(group != "orig" && date == "orig"){
	for(var i = 0; i < object.length; i++){
	    if(object[i].group == group){
		specObj.push(object[i]);
	    }
	}
	
    }
    else{
	for(var i = 0; i < object.length; i++){
            if(object[i].group == group && object[i].gathered == date){
                specObj.push(object[i]);
            }
        }
    }

    return specObj;
}
