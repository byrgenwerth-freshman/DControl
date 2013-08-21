//d_control.js
//By Matt Owens
//
//Description: This is the JavaScript page for the d_control selection page
/*****************************************************************************/
$(document).ready(function()
{
  //String Constansts
  var HOST = 'hosts'
  var VM = 'vms'
  var FLOW = 'netflows'
  var S = 's'
  var G = 'g'
  var HS = 'hs'
  var HG = 'hg'
  var HO_NA = 'Host Name'
  var IP_AD = 'IP Address'
  var GA_TM = 'Gathered Time'
  var HO_ID = 'Host ID'
  var DC_ID = 'Datacenter ID'
  var DEST = 'Destination'
  var SRC = 'Source'

	//
	$.get("/d_control", function(msg)
  {
		var data = msg;
		postCompare(data);
		$(TH).append(HEAD + HO_NA + HMID + IP_AD + HMID + GA_TM + HEND);
		data.info.map(function(data)
    {
			$(TB).append(CB + data.id + CBE + data.dns_name + MID + data.ip_name + MID
                        + data.created_at + END);
    });
  }, "json");
	//

	var info = HOST
	//Need a function that updates the items based on info selection
  $("select[id='info']").change(function()
  {
    info = $(this).val();
    updateList(info, view, start_date, end_date);
  });
  //

	var view = S
	//This function updates the items based on the view.
	$("select[id='view']").change(function()
  {
		view = $(this).val();
    //Update view
		updateList(info, view, start_date, end_date);
  });
	//


	//This function updates the action of the form based on the chart
	//selection
	$("select[id='chart']").change(function()
  {
		var chart = $(this).val();
		$("form[id='theForm']").attr("action", chart);
  });
	//


	var start_date = "1900-1-1";
	var start_date_year = 1900;
	var start_date_month = 1;
	var start_date_day = 1;
	//Start Date Functions
	$("select[id='start_date_year']").change(function()
  {
		start_date_year = $(this).val();
		start_date = (start_date_year + "-" + start_date_month + "-"
			             + start_date_day);
		updateList(info, view, start_date, end_date);
  });
  //

  //
	$("select[id='start_date_month']").change(function()
  {
		start_date_month = $(this).val();
		start_date = (start_date_year + "-" + start_date_month + "-"
                  + start_date_day);
		updateList(info, view, start_date, end_date);
  });
  //

  //
	$("select[id='start_date_day']").change(function(){
		start_date_day = $(this).val();
		start_date = (start_date_year + "-" + start_date_month + "-"
                  + start_date_day);
		updateList(info, view, start_date, end_date);
  });
  //

	var end_date = "5000-12-31";
	var end_date_year = 5000;
	var end_date_month = 12;
	var end_date_day = 31;
  //End Date Functions
	$("select[id='end_date_year']").change(function()
  {
		end_date_year = $(this).val();
		end_date = (end_date_year + "-"
                              + end_date_month + "-"
                              + end_date_day);
		updateList(info, view, start_date, end_date);
  });
  //

  //
	$("select[id='end_date_month']").change(function()
  {
		end_date_month = $(this).val();
		start_date = (end_date_year + "-" + end_date_month + "-"+ end_date_day);
		updateList(info, view, start_date, end_date);
  });
  //

  //
  $("select[id='end_date_day']").change(function()
  {
		end_date_day = $(this).val();
		start_date = (end_date_year + "-"
                              + end_date_month + "-"
                              + end_date_day);
		updateList(info, view, start_date, end_date);
  });
  //


	//Change on the change of compares
	//Should affect what charts can be selected
	$("select[id='compare']").change(function()
  {
      var compare = $(this).val();
  });
	//

	//Change on the change of items
	//Not if needed
	$("select[id='items']").change(function()
  {
		var items = $(this).val() || [];
  });
	//

	//
	function postCompare(data){
    data.compare.map(function(data)
    {
	    $("select[id='compare']").append('<option id="dyComp" value="' + data
                                        + '">' + data + '</option>');
		});
	}
  //

  //
	function updateList(info, view, start_date, end_date)
  {
    $("#compare").children().remove();
    $('tr').remove();
    if(info == HOST)
    {
      updatePath(view, start_date, end_date, "host")
    }
    else if(info == VM)
    {
      updatePath(view, start_date, end_date, "vm")
    }
    else if(info == FLOW)
    {
      updatePath(view, start_date, end_date, "flow")
    }
	}
  //

  //
  function updatePath(view, start_date, end_date, path)
  {
    var jInfo = {"type": String(info), "view": String(view),
                    "start_date": String(start_date),
                    "end_date": String(end_date)};
    $.post('/d_control/' + path, jInfo, function(data)
    {
      postToController(data);
    } ,"json");

  }
  //

  //
  function postToController(data)
  {
    var response = data;
    console.log(data);
    console.log(info);
    if(info == HOST)
    {
      postCompare(data);
      if(view == S)
      {
        $(TH).append(HEAD + HO_NA + HMID + IP_AD + HMID + GA_TM + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.id + CBE + data.dns_name + MID + data.ip_name
                        + MID + data.gathered + END);
        });
      }
      else if(view == G)
      {
        $(TH).append(HEAD + DC_ID + HMID + GA_TM + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.datacenter_id + CBE + data.datacenter_id + MID
                        + data.gathered + END);
        });
      }
      else if(view == HS)
      {
        $(TH).append(HEAD + HO_NA + HMID + IP_AD + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.dns_name + CBE + data.dns_name + MID
                        + data.ip_name + END);
        });
      }
      else if(view == HG)
      {
        $(TH).append(HEAD + DC_ID + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.datacenter_id + CBE + data.datacenter_id
                        + END);
        });
      }
    }
    else if(info == VM)
    {
      postCompare(data);
      if(view == S)
      {
        $(TH).append(HEAD + HO_NA + HMID + IP_AD + HMID + GA_TM + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.id + CBE + data.dns_name + MID + data.ip_name
                        + MID + data.gathered + END);
        });
      }
      else if(view == G)
      {
        $(TH).append(HEAD + HO_ID + HMID + GA_TM + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.host_id + CBE + data.host_id + MID
                            + data.gathered + END);
        });
      }
      else if(view == HS)
      {
        $(TH).append(HEAD + HO_NA + HMID + IP_AD + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.id + CBE + data.dns_name + MID + data.ip_name
                        + END);
        });
      }
      else if(view == HG)
      {
        $(TH).append(HEAD + HO_ID + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.host_id + CBE+ data.host_id + END);
        });
      }
    }
    else if(info == FLOW)
    {
      postCompare(data);
      if(view == S)
      {
        $(TH).append(HEAD + DEST + HMID + SRC + HMID + GA_TM + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.id + CBE + data.destination_ip + MID
                            + data.source_ip + MID + data.gathered + END);
        });
      }
      else if(view == G)
      {
        $(TH).append(HEAD + SRC + HMID + GA_TM + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.source_ip + CBE + data.source_ip + MID
                            + data.gathered + END);
        });
      }
      else if(view == HS)
      {
        $(TH).append(HEAD + DEST + HMID + SRC+ HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.id + CBE + data.destination_ip + MID
                        + data.source_ip + END);
        });
      }
      else if(view == HG)
      {
        $(TH).append(HEAD + SRC + HEND);
        data.info.map(function(data)
        {
          $(TB).append(CB + data.source_ip + CBE + data.source_ip + END);
        });
      }
    }
  }
  //

  //HTML Constants
  var TH = 'thead'
  var TB = 'tbody'
  var HEAD = '<tr><th><input type="checkbox" id="SelectAll"></th><th>'
  var HMID = '</th><th>'
  var HEND = '</th></tr>'
  var CB = '<tr id="dyTR"><td><input type="checkbox" name="items[]" value="'
  var CBE = '"><td>'
  var MID = '</td><td>'
  var END = '</td></tr>'

});
//