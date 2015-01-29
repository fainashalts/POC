class TopicsController < ApplicationController
# before filter to give only administrators the ability to add, edit, and delete topics.
before_action :authenticate_user!, except: [:index, :show]
before_filter :admin, except: [:index, :show]


	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
		@links = Link.all
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
		redirect_to :back
	end

	

	private

	def topic_params
		params.require(:topic).permit(:name)
	end

	# custom method for the topics controller, please see before filter above
	def admin
	  authenticate_user!
	  if current_user.admin
	     return
	  else
	     redirect_to root_url
	  end
	end

end

