#d_control_controller.rb
#By: Matt Owens

###############################################################################
class DControlController < ApplicationController
  #Initializes the page
  def index
    info = params[:type]
    #Set up how the view works
    view = params[:view]
    
    #For single view
    if info.to_s == 'hosts' and view.to_s == 's'
      @selected = Host.all
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'vms' and view.to_s == 's'
      @selected = Vm.all
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'netflows' and view.to_s == 's'
      @selected = Flow.all
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    
    #For group view
    #Need to add distinct date as well
    elsif info.to_s == 'hosts' and view.to_s == 'g'
      @selected = Host.find(:all, :select => "DISTINCT datacenter_id")
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'vms' and view.to_s == 'g'
      @selected = Vm.find(:all, :select => "DISTINCT host_id")
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'netflows' and view.to_s == 'g'
      @selected = Flow.find(:all, :select => "DISTINCT source_ip")
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    
    #For historical single view
    elsif info.to_s == 'hosts' and view.to_s == 'hs'
      @selected = Host.find(:all, :select => "DISTINCT dns_name")
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'vms' and view.to_s == 'hs'
      @selected = Vm.find(:all, :select => "DISTINCT dns_name")
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
      @selected = Host.find(:all, :select => "DISTINCT datacenter_id")
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'vms' and view.to_s == 'hg'
      @selected = Vm.find(:all, :select => "DISTINCT host_id")
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif info.to_s == 'netflows' and view.to_s == 'hg'
      @selected = Flow.find(:all, :select => "DISTINCT source_ip")
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
