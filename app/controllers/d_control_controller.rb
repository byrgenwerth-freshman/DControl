#d_control_controller.rb
#By: Matt Owens
###############################################################################
class DControlController < ApplicationController
  #Initializes the page
  def index
    #Set up how the view works
    view = params[:view]

    @selected = Host.all
    @names = Host.column_names
    respond_to do |format|
      format.html
      format.json { render :json => {:info =>  @selected, :compare => @names}}
    end
  end

  def host
    view = params[:view]
    start_date = params[:start_date]
    end_date = params[:end_date]

    if view.to_s == 's'
      @selected = Host.where("gathered >= :start_date AND gathered <= :end_date",
                             :start_date => start_date, :end_date => end_date)
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'g'
      @selected = Host.select("DISTINCT datacenter_id, gathered").where("gathered >= :start_date AND gathered <= :end_date", :start_date => start_date, :end_date => end_date)
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'hs'
      @selected = Host.select("DISTINCT dns_name")
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'hg'
      @selected = Host.select("DISTINCT datacenter_id")
      @names = Host.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    end
  end

  def vm
    view = params[:view]
    start_date = params[:start_date]
    end_date = params[:end_date]

    if view.to_s == 's'
      @selected = Vm.where("gathered >= :start_date AND gathered <= :end_date",
                             :start_date => start_date, :end_date => end_date)
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'g'
      @selected = Vm.select("DISTINCT host_id").where("gathered >= :start_date AND gathered <= :end_date", :start_date => start_date, :end_date => end_date)
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'hs'
      @selected = Vm.select("DISTINCT dns_name")
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'hg'
      @selected = Vm.select("DISTINCT host_id")
      @names = Vm.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    end
  end

  def flow
    view = params[:view]
    start_date = params[:start_date]
    end_date = params[:end_date]

    if view.to_s == 's'
      @selected = Flow.limit(100)
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'g'
      @selected = Flow.limit(100)
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'hs'
      @selected = Flow.limit(100)
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    elsif view.to_s == 'hg'
       @selected = Flow.limit(100)
      @names = Flow.column_names
      respond_to do |format|
        format.json { render :json => {:info =>  @selected, :compare => @names}}
      end
    end
  end
end
