$(document).ready(function(){
	var items = [];
	var compare = "memory";


	$("select[id='items']").change(function(){
	    items = $(this).val() || [];
	    return items
	});

	$("select[id='compare']").change(function(){
	    compare = $(this).val();
	    return compare
	});


	/*$("button").click(function(){
	    console.log(compare);
	    console.log(items);
	    $.ajax({
		    url: "/dcontrol/post",
		    dataType: "JSON",
		    type: "POST",
		    data: {graph: {compare: compare, items: items}}
		})
		});*/
	
	
} );