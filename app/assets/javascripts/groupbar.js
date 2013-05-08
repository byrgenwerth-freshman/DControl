//Grouped Bar Chart
//Taken from http://bl.ocks.org/mbostock/3887051
//Edited by Matt Owens
/*****************************************************************************/

$(document).ready(function(){
	$.get("/d_control/groupbar", function(msg){
		var data = msg;
		
		var reGroup = [];
		//Needs to be moved to the model rather than doing it in the view
		/*************************************************************/
		//Get the unique values
		for (var i = 0; i < data.length; i++){
		    //Check for group name
		    var check = data[i].datacenter_id;
		    //Check
		    var sentinal = true;
		    for(var j = 0; j < reGroup.length; j++){
			if(check == reGroup[j].datacenter_id){
			    sentinal = false;
			}	
		    }
		    if(sentinal == true){
			reGroup.push({"datacenter_id": check});
		    }
		}
		
		//Add the values to the right group
		for(var i = 0; i < reGroup.length; i++){
		    reGroup[i].data = []
		    for(var j = 0; j < data.length; j++){
			if(reGroup[i].datacenter_id == data[j].datacenter_id){
			    if (data[j].id != null){
				reGroup[i].data.push({"dns_name": data[j].dns_name,
						      "info": data[j].id});
			    }
			    else if (data[j].cpu_count != null){
				reGroup[i].data.push({"dns_name": data[j].dns_name,
                                                      "info": data[j].cpu_count});
			    }
			}
		    }
		}
		/*************************************************************/

		console.log(reGroup);
	
		var margin = {top: 20, right: 20, bottom: 30, left: 40},
		    width = 960 - margin.left - margin.right,
			height = 500 - margin.top - margin.bottom;
		    
		    var x0 = d3.scale.ordinal()
			.rangeRoundBands([0, width], .1);
	    
		    var x1 = d3.scale.ordinal();
		    
		    var y = d3.scale.linear()
			.range([height, 0]);
	    
		    var color = d3.scale.ordinal()
			.range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

		    var xAxis = d3.svg.axis()
			.scale(x0)
			.orient("bottom");
		    
		    var yAxis = d3.svg.axis()
			.scale(y)
			.orient("left")
			.tickFormat(d3.format(".2s"));

		    var svg = d3.select("#chart").append("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", height + margin.top + margin.bottom)
			.append("g")
			.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		    //Start working with variables here
		    var infoNames = reGroup[0].data.map(function(d) {return d.info});
		    
		    
		    console.log(infoNames);
		    x0.domain(reGroup.map(function(d) { return d.datacenter_id; }));
		    x1.domain(infoNames).rangeRoundBands([0, x0.rangeBand()]);
		    y.domain([0, d3.max(reGroup, function(d) { return d3.max(d.data, function(d) { return d.info
						})})]);
		    
		    svg.append("g")
			.attr("class", "x axis")
			.attr("transform", "translate(0," + height + ")")
			.call(xAxis);

		    svg.append("g")
			.attr("class", "y axis")
			.call(yAxis)
			.append("text")
			.attr("transform", "rotate(-90)")
			.attr("y", 6)
			.attr("dy", ".71em")
			.style("text-anchor", "end")
			//Needs to reflect the passed data
			.text("Data");

		    var state = svg.selectAll(".state")
			.data(reGroup)
			.enter().append("g")
			.attr("class", "g")
			.attr("transform", function(d) { return "translate(" + x0(d.data) + ",0)"; });
		    
		    state.selectAll("rect")
			.data(function(d) { return d.data; })
			.enter().append("rect")
			.attr("width", x1.rangeBand())
			.attr("x", function(d) { return x1(d.info); })
			.attr("y", function(d) { return y(d.info); })
			.attr("height", function(d) { return height - y(d.info); })
			.style("fill", function(d) { return color(d.dns_names); });

		    /*var legend = svg.selectAll(".legend")
			//ageNames
			.data(reGroup.data.dnsNames.slice().reverse())
			.enter().append("g")
			.attr("class", "legend")
			.attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

		    legend.append("rect")
			.attr("x", width - 18)
			.attr("width", 18)
			.attr("height", 18)
			.style("fill", color);

		    legend.append("text")
			.attr("x", width - 24)
			.attr("y", 9)
			.attr("dy", ".35em")
			.style("text-anchor", "end")
			.text(function(d) { return d; });*/


	    }, "json");
	
    });