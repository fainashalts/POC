class SubtopicsController < ApplicationController
skip_before_action :admin, only: [:index, :show]

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
		redirect_to subtopics_path
	end

	

	private

	def subtopic_params
		params.require(:subtopic).permit(:topic_id, :name)
	end

end


