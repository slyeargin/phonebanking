class ResponsesController < ApplicationController

  before_action :authenticate_user!

  def new

  end

  def create

  end

  def show
    @response = Response.find(params[:id])
  end


  protected

  def response_params
    params.require(:response).permit(:question, :answer)
  end

end
