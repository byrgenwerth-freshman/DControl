class NetworkflowgraphController < ApplicationController

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

    if session[:info].to_s == 'netflows'
        if session[:view].to_s == 's'
          @data = Flow.find(session[:items])
        elsif session[:view].to_s == 'g'
          @data = Flow.where("source_ip IN (?)", session[:items])
        elsif session[:view].to_s == 'hs'
          @data = Flow.find(session[:items], :select => session[:compare])
        elsif session[:view].to_s == 'hg'
          @data = Flow.where("source_ip IN (?)", session[:items])
        end
      end



    respond_to do |format|
      format.html
      #This will send the complete database objecect
      format.json { render json: @data}
    end
  end
end
