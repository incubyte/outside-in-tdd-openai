
class OpenaiController < ApplicationController
  def show
    response = OpenaiService.new(params[:q]).ask
    render json: { 'message' => response }
  end
end
