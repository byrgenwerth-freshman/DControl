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
		makeTable(object);
	    }, "json");

	//When Grouping Changes
	var groupings = "orig";
	$("select[id='Groupings']").change(function(){
		groupings = $(this).val();
		console.log(groupings);
		var specObj = createSpecObj(groupings, dates, object);
		$("svg").remove();
		makeTable(object);
		
	    });


	//When date changes
	var dates = "orig";
	$("select[id='Dates']").change(function(){
		dates = $(this).val();
		console.log(dates);
		var specObj = createSpecObj(groupings, dates, object);
		$("svg").remove();
		makeTable(object);
		  
            });



    });

/*************************************************************************************/

function makeTable(object) {

/*	var mytable = "<table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr>";

	for(var i = 0; i < object.length; i++) {
		mytable += "<td>" + object[i].dns_name + "</td>";
	}
	mytable += "</tr></tbody></table>";

	document.write(mytable);*/
	
	var table = document.createElement("table");
	var i = 0;
	for (var r = 0; r < object.length; r++) {
		var row = table.insertRow(-1);
		//for (var c = 0; c < 2; c++) {
			var cell = row.insertCell(-1);
			cell.appendChild(document.createTextNode(object[i].dns_name));
			var cell = row.insertCell(-1);
			cell.appendChild(document.createTextNode(object[i].gathered));	
		//}
		i++;
  	}	
	
	table.className = "table";
	$("#chart").append(table);

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
