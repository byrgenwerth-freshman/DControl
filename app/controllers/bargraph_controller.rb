#bargraph_controller.rb
#By Matt Owens
#
#
#######################################################################################
class BargraphController < ApplicationController
  
 
  def index
    #Need to check to see if the passed variables have changed
    if session[:items].nil? || session[:compare].nil?
      session[:items] = params[:items]
      session[:compare] = params[:compare]
    elsif !params[:items].nil? || !params[:compare].nil?
      session[:items] = params[:items]
      session[:compare] = params[:compare]
    end
    @items = session[:items]
    @comapare = session[:compare]
    #Need to look up the dns_names and the item to be compared base on the ids passed
    #in items.

    #
    Rails.logger.warn @items
    Rails.logger.warn @compare
    respond_to do |format|
      format.html
      format.json { render json: @items}
    end
  end

end
