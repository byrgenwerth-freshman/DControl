//d_control.js
//By Matt Owens
//
//Description: This is the JavaScript page for the d_control selection page
/*************************************************************************************/
$(document).ready(function(){

	
	//Need a function that updates the items based on info selection
        $("select[id='info']").change(function(){
		var info = $(this).val();
                console.log("Change is in the air");
		//This will send a post to the controller to update the page
		$.post('dcontrol/ChangedInfo', info , function(data){
			alert("Data Loaded: " + data);
		    });
            });
        //    
	
	//Need a function that updates the items based off of Start Date               


        //                                                                             

        //Need a function that update the itemes based off of the End Date            

 
        //    


	//Change on the change of compares
	//Should affect what charts can be selected
	$("select[id='compare']").change(function(){
                var compare = $(this).val();
            });
	//

	//Change on the change of items
	//Not if needed
	$("select[id='items']").change(function(){
		var items = $(this).val() || [];
	    });
	//


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