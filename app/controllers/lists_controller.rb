class ListsController < ApplicationController
before_action :set_event, :only => [ :show, :edit, :update, :destroy]

def index
	@lists = List.all
end

def new
	@list = List.new
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


private
def list_params
	params.require(:list).permit(:name, :description, :isbn)
end




end
