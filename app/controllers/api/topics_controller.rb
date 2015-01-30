module Api
  class TopicsController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def index
      topics = Topic.all 
      respond_with topics
    end

    def create
      topic = Topic.new(topic_params)
        if topic.save
          respond_with topic, location: [:api, topic]
        else
          respond_with topic
        end
    end
    
    def show 
      topic = Topic.find(params[:id])
      respond_with topic
    end

    def update
      topic = Topic.find(params[:id])
        if topic.update_attributes(topic_params)  
          head 204
        else
          respond_with topic
        end
    end

    def destroy
      topic = Topic.find(params[:id])
      topic.destroy
      head 204
    end

    private 
    def topic_params
      params.require(:topic).permit(:name)
    end

  end
end