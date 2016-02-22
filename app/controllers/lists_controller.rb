class ListsController < ApplicationController
  def index
  	@lists = List.all
  	@list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to '/'
  end

  private

  def list_params
  	params.require(:list).permit(:title, :description, :progress)
  end
end
