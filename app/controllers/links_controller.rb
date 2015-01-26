class LinksController < ApplicationController
# before filter so that only admins can edit and destroy links; might want to allow the user who added a link to edit it (say, if they typed something incorrectly). Something we as a group should decide.
before_filter :custom_method, :only => [:edit, :destroy]	
	
	def upvote
		@link = Link.find(params[:id])
		@link.upvote_by current_user
		redirect_to links_path
	end

	def fetch
		@link = LinkThumbnailer.generate(params[:url])
		respond_to do |format|
			format.json do
				result.to_json
			end
		end
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
			@link = Link.new(link_params)

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
			params.require(:link).permit(:title, :url)
		end


		# custom method for before filter at the top of this page.
		def custom_method
		  
		  authenticate_user!

		  if current_user.admin
		     return
		  else
		     redirect_to root_url
		  end

		end



end
