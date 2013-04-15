#bargraph_controller.rb
#By Matt Owens
#################################################################################
class BargraphController < ApplicationController 
  def index
    #Need to check to see if the passed variables have changed
    if session[:items].nil? || session[:compare].nil? || session[:info].nil? || session[:view].nil?
      session[:items] = params[:items]
      session[:compare] = params[:compare]
      session[:info] = params[:info]
      session[:view] = params[:view]
    elsif !params[:items].nil? || !params[:compare].nil? || !params[:info].nil? || !params[:view].nil?
      session[:items] = params[:items]
      session[:compare] = params[:compare]
      session[:info] = params[:info]
      session[:view] = params[:view]
    end

    #Check to see if there are any items
    if !session[:items].nil?
      if session[:info].to_s == 'hosts'
        if session[:view].to_s == 's'
          @data = Host.find(session[:items], :select => session[:compare])
          @record = Host.find(session[:items])
        elsif session[:view].to_s == 'g'
          @data = Host.where("datacenter_id = ?", session[:items]).select(session[:compare])
          @record = Host.find(session[:items])
        elsif session[:view].to_s == 'hs'
          @data = Host.find(session[:items], :select => session[:compare])
          @record = Host.find(session[:items])
        elsif session[:view].to_s == 'hg'
          @data = Host.where("datacenter_id = ?", session[:items]).select(session[:compare])
          @record = Host.find(session[:items])
        end
      elsif session[:info].to_s == 'vms'
        if session[:view].to_s == 's'
          @data = Vm.find(session[:items], :select => session[:compare])
          @record = Vm.find(session[:items])
        elsif session[:view].to_s == 'g'          
          @data = Vm.where("host_id IN (?)", session[:items]).select(session[:compare])
          @record = Vm.find(session[:items])
        elsif session[:view].to_s == 'hs'
          @data = Vm.find(session[:items], :select => session[:compare])
          @record = Vm.find(session[:items])
        elsif session[:view].to_s == 'hg'
          @data = Vm.where("host_id IN (?)", session[:items]).select(session[:compare])
          @record = Vm.find(session[:items])
        end
      elsif session[:info].to_s == 'netflows'
        if session[:view].to_s == 's'
          @data = Flow.find(session[:items], :select => session[:compare])
          @record = Flow.find(session[:items])
        elsif session[:view].to_s == 'g'
          @data = Flow.find(session[:items], :select => session[:compare])
          @record = Flow.find(session[:items])
        elsif session[:view].to_s == 'hs'
          @data = Flow.find(session[:items], :select => session[:compare])
          @record = Flow.find(session[:items])
        elsif session[:view].to_s == 'hg'
          @data = Flow.find(session[:items], :select => session[:compare])
          @record = Flow.find(session[:items])
        end
      end
    end

    #This needs to get the compare item and send it and the dns_name only
    #compare
    
    #Need to look up the dns_names and the item to be compared base on the ids
    #passed in items.
    compare = session[:compare]

    respond_to do |format|
      format.html
      #This will send the complete database objecects
      format.json { render json: @data}
    end
  end
end
