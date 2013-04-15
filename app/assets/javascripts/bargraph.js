//bargraph.js
//Taken from: http://bl.ocks.org/mbostock/3885705
//Modified: Matt Owens
//
//Description: This file is the JavaScript that controls the bargraph
/*************************************************************************************/

$(document).ready(function(){
	//Get command on the bargraph controller function index
	$.get("/d_control/bargraph", function(msg){

		//Taking the results (JSON) of get command and putting into a var
		var data = msg;
		var object = [];
		var compItem;

		//Convert the data from the controller
		for (var i = 0; i < data.length; i++){
		    for(var key in data[i]){
			compItem = key;
			var tmp = {};
			if (data[i].hasOwnProperty(key)){
			    tmp.data = data[i][key];
			    object.push(tmp);
			    console.log(data[i][key]);
			}
		    }
		}

		console.log(object);
		
		//Define the size of box
		var margin = {top: 20, right: 20, bottom: 200, left: 40},
		    width = 600 - margin.left - margin.right,
		    height = 500 - margin.top - margin.bottom;
 
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

		    
		    //x.domain(data);
		    x.domain(object.map(function(d) {return d.data } ))
		    //Needs to be changed so that it will scale with the data
		    //y.domain([0, 60]);
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
			.attr("x", function(object) { return x(object.data); })
			.attr("width", x.rangeBand())
			.attr("y", function(object) { return y(object.data); })
			.attr("height",  function(object) { return height - y(object.data); });
		    
		    //This will sort the bars and needs to be sorted out. 
		    /*
		      d3.select("input").on("change", change);
	   
		      var sortTimeout = setTimeout(function() {
		      d3.select("input").property("checked", true).each(change);
		      }, 2000);

		      function change() {

		      clearTimeout(sortTimeout);
 		      // Copy-on-write since tweens are evaluated after a delay.
		      var x0 = x.domain(data.sort(this.checked
		      ? function(a, b) { return b.data - a.data; }
		      : function(a, b) { return d3.ascending(a.data, b.data); })
		      .map(data)
		      .copy();

		      var transition = svg.transition().duration(500),
		      delay = function(d, i) { return i * 50; };

		      transition.selectAll(".bar")
		      .delay(delay)
		      .attr("x", data);

		      transition.select(".x.axis")
		      .call(xAxis)
		      .selectAll("g")
		      .delay(delay)
		      .selectAll("text")
		      .style("text-anchor", "start");

	      }*/
    }, "json");
});