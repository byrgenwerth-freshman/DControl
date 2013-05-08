//Flow Graph
//Taken from http://bl.ocks.org/mbostock/4062045
//Edited by Matt Owens
/*****************************************************************************/
$(document).ready(function(){
	$.get("/d_control/flowgraph", function(msg){
		var graph = {"nodes": [], "links": []};
		
		//Get all the source nodes
		for(var i = 0; i < msg.length; i++){
		    var control = true;
		    for(var j = 0; j < graph.nodes.length; j++){
			if(msg[i].source_ip == graph.nodes[j].name){
			    control = false;
			}
		    }
		    if (control == true){
			graph.nodes.push({"name" : msg[i].source_ip,"group": 1});
			}
		}

		//Get all the destination nodes
		for(var i = 0; i < msg.length; i++){
                    var control = true;
                    for(var j = 0; j < graph.nodes.length; j++){
			if(msg[i].destination_ip == graph.nodes[j].name){
                            control = false;
                        }
                    }
                    if (control == true){
                        graph.nodes.push({"name" : msg[i].destination_ip,"group": 1});
		    }
                }


		//Add all the connection links
		for(var i = 0; i < msg.length; i++){
		    //Find source
		    var s_node;
		    for(var j = 0; j < graph.nodes.length; j++){
			if (msg[i].source_ip == graph.nodes[j].name){
			    s_node = j;
			}

		    }
		    var d_node;
		    //Find destination
		    for(var j = 0; j < graph.nodes.length; j++){
			if (msg[i].destination_ip == graph.nodes[j].name){
                            d_node = j;
                        }

		    }   
		    graph.links.push({"source": s_node, "target": d_node,"value": 1});
		}
	
		console.log(graph);
		
		makeGraph(graph);

	    }, "json");
    });

function makeGraph(graph){
    var width = 960,
	height = 500;

    var color = d3.scale.category20();

    var force = d3.layout.force()
	.charge(-120)
	.linkDistance(30)
	.size([width, height]);

    var svg = d3.select("#chart").append("svg")
	.attr("width", width)
	.attr("height", height);
        
    force
	.nodes(graph.nodes)
	.links(graph.links)
	.start();

    var link = svg.selectAll(".link")
	.data(graph.links)
	.enter().append("line")
	.attr("class", "link")
	.style("stroke-width", function(d) { return Math.sqrt(d.value); });


    var node = svg.selectAll(".node")
	.data(graph.nodes)
	.enter().append("circle")
	.attr("class", "node")
	.attr("r", 5)
	.style("fill", function(d) { return color(d.group); })
	.call(force.drag);

    node.append("title")
	.text(function(d) { return d.name; });

    force.on("tick", function() {
	    link.attr("x1", function(d) { return d.source.x; })
		.attr("y1", function(d) { return d.source.y; })
		.attr("x2", function(d) { return d.target.x; })
		.attr("y2", function(d) { return d.target.y; });

	    node.attr("cx", function(d) { return d.x; })
		.attr("cy", function(d) { return d.y; });
	});
}