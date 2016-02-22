class ListsController < ApplicationController
  def index
  	lists = List.all
    @lists = lists.reverse
  end

  def create
    @list = List.create(list_params)

    if @list.save

      respond_to do |format|
        format.html {redirect_to root_path, notice: 'New item added!' }
        format.js {flash.now[:notice] = "New List Item!"}
      end

    else 

      respond_to do |format|
        format.html {redirect_to root_path, notice: "Something just ain't right"}
        format.js {flash.now[:notice] = "There was a problem, homie"}
      end

    end

  end


  def edit 

  end

  def update

  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

  end

  private

  def list_params
  	params.require(:list).permit(:title, :description, :progress).merge(user: current_user)
  end
end
