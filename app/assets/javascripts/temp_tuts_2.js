
/*========PATHS========
//paths can be used to make any shape
//path data stored in the "d" attribute
//d3 has path generators to make using paths easier

var canvas = d3.select("#chart").append("svg")
		.attr("width", 500)
		.attr("height", 500);

var data = [
	{x: 10, y: 20},
	{x: 40, y: 60},
	{x: 50, y: 70}
];

var group = canvas.append("g")
	.attr("transform", "translate(100, 100)");

//line generator
var line = d3.svg.line()
		.x(function(d) { return d.x; })
		.y(function(d) { return d.y; });
//bind data to the path
group.selectAll("path")
	.data([data]) //pass in data as an array so there is one path for all the data - not a separate path for each element in the array
	.enter()
	   .append("path")
	   .attr("d", line) //use line var that we created to draw paths
	   .attr("fill", "none")
	   .attr("stroke", "#000")
	   .attr("stroke-width", 10);
==============================*/

/*=======ARCS====================

var canvas = d3.select("#chart").append("svg")
		.attr("width", 500)
		.attr("height", 500);

var group = canvas.append("g")
		.attr("transform", "translate(100, 100)");

//const variables
var r = 100; //radius
var p = Math.PI * 2; //perimeter in radians


//arc path generator
var arc = d3.svg.arc()
		//four accessor functions we need to specify
		.innerRadius(r - 20)
		.outerRadius(r)
		//angles are measured in radians
		.startAngle(0)
		.endAngle(p-1);//perimeter minus 1 radian

group.append("path")
	.attr("d", arc)
==============================*/

/*pie/donut chart

var data = [10, 50, 80];
var r = 300;

//color scale
var color = d3.scale.ordinal()
		.range(["red", "blue", "orange"]);

var canvas = d3.select("body").append("svg")
		.attr("width", 1000)
		.attr("height", 1000);

//group to store visualization
var group = canvas.append("g")
		.attr("transform", "translate(300, 300)");

//arc path generator
var arc = d3.svg.arc()
		.innerRadius(200)
		.outerRadius(r);

//layout - number available in d3
//each layout takes a set of data and recalculates it and returns something different
//pie - takes data and for each data element returns an object with a start angle, end angle and value property
var pie = d3.layout.pie()
		.value(function(d) {return d;});

var arcs = group.selectAll(".arc")
		.data(pie(data))
		.enter()
		   .append("g")
		   .attr("class", "arc");

//append path to each arc object
arcs.append("path")
	.attr("d", arc) //"d" fetches it's path data from the arc path generator
	.attr("fill", function(d) { return color(d.data); });

arcs.append("text")
	.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; } )
	.text(function(d) { return d.data; })
	.attr("text-anchor", "middle")
	.attr("font-size", "1.5em");

==================================*/

d3.csv("lib/assets/ages.csv", function(data) {
	console.log(data);
})
