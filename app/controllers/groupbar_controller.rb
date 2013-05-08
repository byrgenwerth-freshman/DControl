#groupbar_controller.rb
#By Matt Owens
#################################################################################
class GroupbarController < ApplicationController
  def index
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

    if !session[:items].nil?
      if session[:info].to_s == 'hosts'
        if session[:view].to_s == 's'
          @data = nil
        elsif session[:view].to_s == 'g'
          @data = Host.where("datacenter_id IN (?)", session[:items]).select(session[:compare] + ",datacenter_id, dns_name")
        elsif session[:view].to_s == 'hs'
          @data = nil
        elsif session[:view].to_s == 'hg'
          @data = Host.where("datacenter_id IN (?)", session[:items]).select(session[:compare] + ",datacenter_id, dns_name")
        end
      elsif session[:info].to_s == 'vms'
        if session[:view].to_s == 's'
          @data = nil
        elsif session[:view].to_s == 'g'
          @data = Vm.where("host_id IN (?)", session[:items])
        elsif session[:view].to_s == 'hs'
          @data = nil
        elsif session[:view].to_s == 'hg'
          @data = Vm.where("host_id IN (?)", session[:items])
        end
      elsif session[:info].to_s == 'netflows'
        if session[:view].to_s == 's'
          @data = nil
        elsif session[:view].to_s == 'g'
          @data = Flow.find(session[:items], :select => session[:compare])
        elsif session[:view].to_s == 'hs'
          @data = nil
        elsif session[:view].to_s == 'hg'
          @data = Flow.find(session[:items], :select => session[:compare])
        end
      end
    end

    respond_to do |format|
      format.html
      #This will send the complete database object
      format.json { render json: @data}
    end
  end
end
