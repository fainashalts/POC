class LinksController < ApplicationController
	
	def upvote
		@link = Link.find(params[:id])
		@link.upvote_by current_user
		redirect_to links_path
	end

	def index
			@links = Link.all
		end

		def show
			@link = Link.find(params[:id])
		end

		def new
			@link = Link.new
		end

		def create
			@link = Link.new (link_params)

			if @link.save
				redirect_to links_path
			else
				render :new
			end
		end

		def edit
			@link = Link.find(params[:id])
		end

		def update

			@link = Link.find(params[:id])

			if @link.update_attributes(link_params)
				redirect_to links_path
			else 
				render "edit"
			end
		end
		
		def destroy
			@link = Link.find(params[:id])
			@link.destroy
			redirect_to links_path
		end

		

		private

		def link_params
			params.require(:link).permit(:name, :link)
		end






end
