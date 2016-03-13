class ListsController < ApplicationController
before_action :set_list, :only => [ :show, :edit, :update, :destroy]

def index
	@lists = List.page(params[:page]).per(5)
end

def edit	
end 


def new
	@list = List.new
end

def update
	if 	@list.update(list_params)
			flash[:notice] = "更新成功"
	  	redirect_to list_path(@list)
	else
			render :action => :edit
	end	
end

def create
	@list = List.new(list_params)
	if 	@list.save
			flash[:notice] = "新增成功"
	  	redirect_to :action => :index
	else
			render :action => :new
	end
end

def destroy
	@list.destroy
	flash[:alert] = "刪除成功"
  redirect_to lists_path # lists#index
end


private
def list_params
	params.require(:list).permit(:name, :description, :isbn)
end

def set_list
  @list = List.find(params[:id])
end


end
