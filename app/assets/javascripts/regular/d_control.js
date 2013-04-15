//d_control.js
//By Matt Owens
//
//Description: This is the JavaScript page for the d_control selection page
/*****************************************************************************/
$(document).ready(function(){	
	//
	$.get("/d_control", function(msg){
		var data = msg;
		postCompare(data);
		$('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
				  + '<th>Host Name</th>'
				  + '<th>IP Address</th>'
				  + '<th>Gathered Time</th>'
				  + '</tr>');
		data.info.map(function(data) {
			$('tbody').append('<tr id="dyTR"><td><input '
                                              +'type="checkbox" name="items[]" value="'
                                              + data.id
                                              +'"><td>'
                                              + data.dns_name
                                              + '</td><td>'
                                              + data.ip_name
                                              + '</td><td>'
                                              + data.created_at
                                              + '</td></tr>'
					  );
		    }
		    );
	    }, "json");
	//
    
	var info = 'hosts'
	//Need a function that updates the items based on info selection
        $("select[id='info']").change(function(){
                info = $(this).val();
		$("#compare").children().remove();            
		$('tr').remove();
                //This will send a post to the controller to update the page
		var jInfo = {"type": String(info), "view": String(view)};
		console.log(jInfo);
		$.post('/d_control', jInfo, function(data){
			postToController(data);
		    }, "json");
	    });
        //                

	var view = 's'
	//This function updates the items based on the view.
	$("select[id='view']").change(function(){
		view = $(this).val();
		$("#compare").children().remove();
		$('tr').remove();
		var jView = {"type": String(info), "view": String(view)};
		console.log(jView);
		$.post('/d_control', jView, function(data){
			postToController(data);
		    }, "json");
	    });
	//


	//This function updates the action of the form based on the chart
	//selection
	$("select[id='chart']").change(function(){
		var chart = $(this).val();
		$("form[id='theForm']").attr("action", chart);
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

	
	//
	function postToController(data){
	    var response = data;
	    console.log(data);
	    console.log(info);
	    if(info == 'hosts'){
		postCompare(data);
		if(view == 's'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
				      + '<th>Host Name</th>'
				      + '<th>IP Address</th>'
				      + '<th>Gathered Time</th>'
				      + '</tr>');
		    data.info.map(function(data) {
			    $('tbody').append('<tr id="dyTR"><td><input '
					      +'type="checkbox" name="items[]" value="'
					      + data.id
					      +'"><td>'
					      + data.dns_name
					      + '</td><td>'
					      + data.ip_name
					      + '</td><td>'
					      + data.gathered
					      + '</td></tr>'
					      );
			}
			);
		}
		else if(view == 'g'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
				      + '<th>Datacenter ID</th>'
				      + '<th>Gathered Time</th>'
				      + '</tr>');
		    data.info.map(function(data) {
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              +'type="checkbox" name="items[]" value="'
                                              + data.datacenter_id
                                              +'"><td>'
                                              + data.datacenter_id
					      + '</td><td>'
					      + data.gathered
                                              + '</td></tr>'
                                              );
                        }
                        );
		}
		else if(view == 'hs'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Host Name</th>'
                                      + '<th>IP Address</th>'
                                      + '</tr>');
		    data.info.map(function(data) {
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              +'type="checkbox" name="items[]" value="'
                                              + data.dns_name
                                              +'"><td>'
                                              + data.dns_name
                                              + '</td><td>'
                                              + data.ip_name
                                              + '</td></tr>'
                                              );
                        }
                        );                                   
		}
		else if(view == 'hg'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Datacenter ID</th>'
				      + '</tr>');
		    data.info.map(function(data) {
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              +'type="checkbox" name="items[]" value="'
                                              + data.datacenter_id
                                              +'"><td>'
                                              + data.datacenter_id
                                              + '</td></tr>'
                                              );
                        }
                        );
		}
	    }
	    else if(info == 'vms'){
		postCompare(data);
		if(view == 's'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Host Name</th>'
                                      + '<th>IP Address</th>'
				      + '<th>Gathered Time</th>'
                                      + '</tr>');
		    data.info.map(function(data){
			    $('tbody').append('<tr id="dyTR"><td><input '
					      + 'type="checkbox" name="items[]" value="'
					      + data.id
					      + '"><td>'
					      + data.dns_name
					      + '</td><td>'
					      + data.ip_name
					      + '</td><td>'
					      + data.gathered
					      + '</td></tr>'
					      );
			}
			);
		}
		else if(view == 'g'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Host ID</th>'                                  
                                      + '<th>Gathered Time</th>'
                                      + '</tr>');
		    data.info.map(function(data){
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              + 'type="checkbox" name="items[]" value="'
                                              + data.host_id
                                              + '"><td>'
                                              + data.host_id
					      + '</td><td>'
                                              + data.gathered
					      + '</td></tr>'
                                              );
                        }
                        );
                }
		else if(view == 'hs'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Host Name</th>'
                                      + '<th>IP Address</th>'
                                      + '</tr>');
		    data.info.map(function(data){
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              + 'type="checkbox" name="items[]" value="'
                                              + data.id
                                              + '"><td>'
                                              + data.dns_name
                                              + '</td><td>'
                                              + data.ip_name
                                              + '</td></tr>'
                                              );
                        }
                        );
                }
		else if(view == 'hg'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Host ID</th>'
				      + '</tr>');
		    data.info.map(function(data){
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              + 'type="checkbox" name="items[]" value="'
                                              + data.host_id
                                              + '"><td>'
                                              + data.host_id
					      + '</td></tr>'
                                              );
                        }
                        );
                }
	    }
	    else if(info == 'netflows'){
		postCompare(data);
		if(view == 's'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Destination</th>'
				      + '<th>Source</th>'
				      + '<th>Gathered</th>'
                                      + '</tr>');
		    data.info.map(function(data){
			    $('tbody').append('<tr id="dyTR"><td><input '
					      + 'type="checkbox" name="items[]" value="'
					      + data.id
					      + '"><td>'
					      + data.destination_ip
					      + '</td><td>'
					      + data.source_ip
					      + '</td><td>'
					      + data.gathered
					      + '</td></tr>'
					      );
			}
			);
		}
		else if(view == 'g'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
				      + '<th>Source</th>'
                                      + '<th>Gathered</th>'
                                      + '</tr>');
		    data.info.map(function(data){
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              + 'type="checkbox" name="items[]" value="'
                                              + data.source_ip
                                              + '"><td>'
					      + data.source_ip
					      + '</td><td>'
                                              + data.gathered
                                              + '</td></tr>'
                                              );
                        }
                        );

                }
                else if(view == 'hs'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Destination</th>'
                                      + '<th>Source</th>'
				      + '</tr>');
		    data.info.map(function(data){
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              + 'type="checkbox" name="items[]" value="'
                                              + data.id
                                              + '"><td>'
                                              + data.destination_ip
                                              + '</td><td>'
                                              + data.source_ip
                                              + '</td></tr>'
                                              );
                        }
                        );

                }
                else if(view == 'hg'){
		    $('thead').append('<tr><th><input type="checkbox" id="SelectAll"></th>'
                                      + '<th>Source</th>'
				      + '</tr>');
		    data.info.map(function(data){
                            $('tbody').append('<tr id="dyTR"><td><input '
                                              + 'type="checkbox" name="items[]" value="'
                                              + data.source_ip
                                              + '"><td>'
					      + data.source_ip
                                              + '</td></tr>'
                                              );
                        }
                        );

                }
	    }
	}
	//
	function postCompare(data){
	    data.compare.map(function(data){
		    $("select[id='compare']").append('<option id="dyComp" value="'
                                                         + data
                                                         +'">'
                                                         + data
						     + '</option>');
		}
		);


	}
    });
//           