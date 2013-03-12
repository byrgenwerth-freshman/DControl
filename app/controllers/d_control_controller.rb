#d_control_controller.rb
#By: Matt Owens

#######################################################################################
class DControlController < ApplicationController
  #Initializes the page
  def index
    #Gets the host information
    @selected = Host.all
  end
  #
  
  #Update the info based on the selection of which info is being parsed
  #Need to set up route
  def infoUpdate
    #item = params
    if item == host
      # @selected = Host.all
    elsif item == vm
      # @selected = VM.all
    elsif item == netflow
      # @selected = Netflow.all
    end

  end
  #
  
  #Update the info for hosts based on date
  #Need to set up route
  def startDateUpdate
    date = params
    # @selected is queried by the date

  end
  #
  
  #
  #Need to set up route
  def endDateUpdate
    date = params
    # @selected is queried by the date
  end
  #

  #Update based on the choice of compare
  #Need to set up route

  #

  #On submit redirect based on the chart select
  #Need to set up route
  def submit
    #Redirect based on chart selected
  end
  #

  #I don't think this is needed anymory. However could be modified so that the 
  #redirct is in the controller.
  def action
    @items = params[:graph][:items]
    @compare = params[:graph][:compare]

    #render :text => "Got: #{@items} and #{@compare}"
    
    redirect_to "/bargraph/#{@items}"
  end
  #

end
