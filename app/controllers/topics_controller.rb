class TopicsController < ApplicationController
before_filter :custom_method, except: [:index, :show]


	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new (link_params)

		if @topic.save
			redirect_to topics_path
		else
			render :new
		end
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update

		@topic = Topic.find(params[:id])

		if @topic.update_attributes(topic_params)
			redirect_to topics_path
		else 
			render "edit"
		end
	end
	
	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
		redirect_to topics_path
	end

	

	private

	def topic_params
		params.require(:topic).permit(:name)
	end

	def custom_method
	  
	  authenticate_user!

	  if current_user.admin
	     return
	  else
	     redirect_to root_url
	  end

	end
	
end

