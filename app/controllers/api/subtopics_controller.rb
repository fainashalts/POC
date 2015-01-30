module Api
  class SubtopicsController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def index 
      subtopics = Subtopic.all 
      respond_with subtopics
    end

    def create
      subtopic = Subtopic.new(subtopic_params)
        if subtopic.save
          respond_with subtopic, location: [:api, subtopic]
        else
          respond_with subtopic
        end
    end

    def show
      subtopic = Subtopic.find(params[:id])
      respond_with subtopic
    end

    def update
      subtopic = Subtopic.find(params[:id])
      if topic.update_attributes(topic_params)
        head 204
      else
        respond_with subtopic
      end

    end

    def destroy 
      subtopic = Subtopic.find(params[:id])
      subtopic.destroy
      head 204
    end

    private
    def topic_params
      params.require(:subtopic).permit(:topic_id, :name)
    end
  end
end

