module Api  

  class LinksController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def index
      links = Link.all
      respond_with links      
    end

    def create
      link = Link.new(link_params)
        if link.save
          respond_with link, location: [:api, link]
        else
          respond_with link
        end
    end

    def show
      link = Link.find(params[:id])
      respond_with link
      
    end

    def update
      link = Link.find(params[:id])
        if link.update_attribute(link_params)
          head 204
        else
          respond_with link
        end
    end

    def destroy
      link = Link.find(params[:id])
      link.destroy
      head 204
    end


    private
    def link_params
      params.require(:link).permit(:title, :url, :subtopic_id, :user_id, :comment)
    end    
  end
end