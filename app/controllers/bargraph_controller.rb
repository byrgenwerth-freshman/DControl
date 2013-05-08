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
          @data = Host.find(session[:items], :select => session[:compare] + ", dns_name, gathered, datacenter_id")
        elsif session[:view].to_s == 'g'
          #id = ""
          #gathered = "" 
          #Fix
          #session[:items].each do |item|           
          #  names = JSON.parse(item.gsub("'", '"'), {:symbolize_names => true})
          #  logger.info(names[:id])
          #  logger.info(names[:gathered])
          #  id = id + "," + names[:id]
          #  gathered = gathered + "," + names[:gathered]
          #  logger.info(id)
          #end
          #id = id[1..-1]
          #gathered = id[1..-1]
          #logger.info(id)
          @data = Host.where("datacenter_id IN (?)", session[:items]).select(session[:compare] + ", dns_name, gathered, datacenter_id")
        #Needs to be fixed
        elsif session[:view].to_s == 'hs'
          @data = Host.where("dns_name IN (?)", session[:items]).select(session[:compare] + ", dns_name, gathered, datacenter_id")
        elsif session[:view].to_s == 'hg'
          @data = Host.where("datacenter_id IN (?)", session[:items]).select(session[:compare] + ", dns_name, gathered, datacenter_id")
        end
      elsif session[:info].to_s == 'vms'
        if session[:view].to_s == 's'
          @data = Vm.find(session[:items], :select => session[:compare] + ", dns_name, gathered, host_id")
        
        elsif session[:view].to_s == 'g'          
          @data = Vm.where("host_id IN (?)", session[:items]).select(session[:compare] + ", dns_name,gathered, host_id")
        
        elsif session[:view].to_s == 'hs'
          @data = Vm.find(session[:items], :select => session[:compare] + ", dns_name, gathered, host_id")
        
        elsif session[:view].to_s == 'hg'
          @data = Vm.where("host_id IN (?)", session[:items]).select(session[:compare] + ", dns_name, gathered, host_id")
        end
      elsif session[:info].to_s == 'netflows'
        if session[:view].to_s == 's'
          @data = Flow.find(session[:items], :select => session[:compare] + ", gathered, destination_ip, source_ip")

        elsif session[:view].to_s == 'g'
          @data = Flow.where("source_id IN (?)", session[:items]).select(session[:compare] + ", gathered, destination_ip, source_ip")
        elsif session[:view].to_s == 'hs'
          @data = Flow.find(session[:items], :select => session[:compare] + ", gathered, destination_ip, source_ip")

        elsif session[:view].to_s == 'hg'
          @data = Flow.find(session[:items], :select => session[:compare] + ", gathered, destination_ip, source_ip")
        end
      end
    end

    #This needs to get the compare item and send it and the dns_name only
    #compare
    
    #Need to look up the dns_names and the item to be compared base on the ids
    #passed in items.

    respond_to do |format|
      format.html
      #This will send the complete database objecects
      format.json { render json: @data}
    end
  end
end
