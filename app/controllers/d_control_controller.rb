#d_control_controller.rb
#By: Matt Owens

###############################################################################
class DControlController < ApplicationController
  #Initializes the page
  def index
    info = params[:type]
    #Set up how the view works
    view = params[:view]
    start_date = params[:start_date]
    end_date = params[:end_date]
    
    #For single view
    if info.to_s == 'hosts' and view.to_s == 's'
      @selected = Host.where("gathered >= :start_date AND gathered <= :end_date",
                             :start_date => start_date, :end_date => end_date)
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'vms' and view.to_s == 's'
      @selected = Vm.where("gathered >= :start_date AND gathered <= :end_date",
                             :start_date => start_date, :end_date => end_date)
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'netflows' and view.to_s == 's'
      @selected = Flow.where("gathered >= :start_date AND gathered <= :end_date",
                             :start_date => start_date, :end_date => end_date)
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    
    #For group view
    #Need to add distinct date as well
    elsif info.to_s == 'hosts' and view.to_s == 'g'
      @selected = Host.select("DISTINCT datacenter_id, gathered").where("gathered >= :start_date AND gathered <= :end_date", :start_date => start_date, :end_date => end_date)
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'vms' and view.to_s == 'g'
      @selected = Vm.select("DISTINCT host_id").where("gathered >= :start_date AND gathered <= :end_date", :start_date => start_date, :end_date => end_date)
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'netflows' and view.to_s == 'g'
      @selected = Flow.select("DISTINCT source_ip").where("gathered >= :start_date AND gathered <= :end_date", :start_date => start_date, :end_date => end_date)
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    
    #For historical single view
    elsif info.to_s == 'hosts' and view.to_s == 'hs'
      @selected = Host.select("DISTINCT dns_name")
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'vms' and view.to_s == 'hs'
      @selected = Vm.select("DISTINCT dns_name")
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'netflows' and view.to_s == 'hs'
      @selected = Flow.all
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    
    #For historical group view
    elsif info.to_s == 'hosts' and view.to_s == 'hg'
      @selected = Host.select("DISTINCT datacenter_id")
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'vms' and view.to_s == 'hg'
      @selected = Vm.select("DISTINCT host_id")
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'netflows' and view.to_s == 'hg'
      @selected = Flow.select("DISTINCT source_ip")
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    
    #Default load
    else
      @selected = Host.all
      @names = Host.column_names
      respond_to do |format|
        format.html
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    end
  end
  #

end
