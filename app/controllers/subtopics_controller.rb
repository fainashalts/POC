class SubtopicsController < ApplicationController
# before filter so that only administrators can add, update, or delete subtopics
before_filter :custom_method, except: [:index, :show]

def index
		@subtopics = Subtopic.all
	end

	def show
		@subtopic = Subtopic.find(params[:id])
	end

	def new
		@subtopic = Subtopic.new
	end

	def create
		@subtopic = Subtopic.new (link_params)

		if @subtopic.save
			redirect_to subtopics_path
		else
			render :new
		end
	end

	def edit
		@subtopic = Subtopic.find(params[:id])
	end

	def update

		@subtopic = Subtopic.find(params[:id])

		if @subtopic.update_attributes(subtopic_params)
			redirect_to topics_path
		else 
			render "edit"
		end
	end
	
	def destroy
		@subtopic = Subtopic.find(params[:id])
		@subtopic.destroy
		redirect_to :back
	end

	

	private

	def subtopic_params
		params.require(:subtopic).permit(:topic_id, :name)
	end

	# custom method for before_filter at top of page
	def custom_method
		  
		  authenticate_user!

		  if current_user.admin
		     return
		  else
		     redirect_to root_url
		  end

		end
		
end


