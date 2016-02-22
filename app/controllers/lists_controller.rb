class ListsController < ApplicationController
  def index

    if current_user 
    	@lists = current_user.lists.all.reverse
    else
      redirect_to signin_path
    end
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
    @list = List.find(params[:id])
  end

  def update
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js   { render :layout => false }
    end

  end

  private

  def list_params
  	params.require(:list).permit(:title).merge(user: current_user)
  end
end
