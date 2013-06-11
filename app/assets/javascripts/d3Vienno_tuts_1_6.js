//Source code from D3 tutorials by d3Vienno
//Tutorials 1 - 6
//YouTube Channel: http://www.youtube.com/user/d3Vienno
//Compiled by Kelsey Leftwich
/*****************************************************************************/

/*--- Playing with D3 --- */

//data for our visualization
var dataArray = [20, 40, 50, 60];

//scalable vector graphics

var width = 500;
var height = 500;

//setting up a basic scale to take an input range and transform the range into a new range that will fit into our container
//largest value will have the max width of our container and all other data points will be recalculated
var widthScale = d3.scale.linear() //linear scale denotes that values in calc range are result of linear function applied to domain values
		.domain([0, 60])
		.range([0, width-10]);

//color scale
var color = d3.scale.linear()
		.domain([0, 60])
		.range(["red", "blue"]);

//axis
var axis = d3.svg.axis()
		.ticks(5)
		.scale(widthScale); //using scale we made above

//"canvas" variable represents our svg code
var canvas = d3.select("#chart")
	.append("svg")
	.attr("width", width)
	.attr("height", height)
	.append("g") //group element
	.attr("transform", "translate(0, 0)") //transforming the group - shifting it to the right and down

//scales are functions and objects
// - treat as functions
// - return add'l methods we can use to alter behavior

//the group "g" lets us apply transformations to all the elements in the group - in this case to all of the bars in our chart

//bars for barchart
var bars = canvas
	.selectAll("rect") //selects all elements specified - empty array
	.data(dataArray) //bind data to empty array
	.enter() //returns placeholders for each data element for which there are no corresponding elements on the page
	   .append("rect") //append bar for each placeholder
	   .attr("width", function(d) { return widthScale(d); }) //width of rectangle will be a function of the data
	   .attr("height", 50)
	   .attr("y", function(d, i) { return i * 100 }) //y-coordinate is a function of the data and index number
	   .attr("fill", function(d) { return color(d) });

//axis
canvas.append("g")
	.attr("transform", "translate(0, 400)")
	.call(axis);

/*------------------------*/


/*var margin = {top: 20, right: 20, bottom: 30, left: 50},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var parseDate = d3.time.format("%d-%b-%y").parse;

var x = d3.time.scale()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var line = d3.svg.line()
    .x(function(d) { return x(d.date); })
    .y(function(d) { return y(d.close); });

var svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.tsv("data.tsv", function(error, data) {
	data.forEach(function(d) {
		d.date = parseDate(d.date);
		d.close = +d.close;
	    });

	x.domain(d3.extent(data, function(d) { return d.date; }));
	y.domain(d3.extent(data, function(d) { return d.close; }));

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
	    .text("Price ($)");

	svg.append("path")
	    .datum(data)
	    .attr("class", "line")
	    .attr("d", line);
    });*/
