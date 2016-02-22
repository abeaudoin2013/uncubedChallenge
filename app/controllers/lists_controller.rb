class ListsController < ApplicationController
  def index
  	@lists = List.all
  	@list = List.new
  end

  def create
    @list = List.create(list_params)

    if @list.save
    	redirect_to '/'
    else 
    	redirect_to '/', notice: "Unable to save time card"
    end

  end

  def edit 

  end

  def update

  end

  def destroy

  end

  private

  def list_params
  	params.require(:list).permit(:title, :description, :progress).merge(user: current_user)
  end
end
