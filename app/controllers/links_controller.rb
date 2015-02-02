require 'link_thumbnailer'

class LinksController < ApplicationController
# before filter so that only admins can edit and destroy links; might want to allow the user who added a link to edit it (say, if they typed something incorrectly). Something we as a group should decide.
before_filter :admin, :only => [:edit, :destroy]	
before_action :authenticate_user!, except: [:index, :show]

	
	def upvote
		@link = Link.find(params[:id])
		@link.upvote_by current_user
		# We want to impliment the upvote method in multiple views, redirect_to :back allows us to return to the page that we were on instead of redirecting to a specific place after each upvote
		redirect_to :back
	end


	def index
			@user = current_user

			@link = Link.new
			@links = Link.all		
	end

	def show
			@link = Link.find(params[:id])
	end


	def new

			@link = Link.new
	end


	def create

			# had to add a begin-rescue block here to ensure that a url that throws an error when fetched by the LinkThumbnailer gem does not break the site; with this block in place, an error will be rescued and the user will be sent back to the page they were on before. Unfortunately, I was unable to get the puts message to show on the screen, and am unsure why. I was able to render text, but this put the user on a new page and didn't seem ideal from a UX perspective...
		begin
			@link = current_user.links.new(link_params)
		
	
			@object = LinkThumbnailer.generate(@link.url)
		
		rescue
			redirect_to :back
			# render :text => "Sorry, that link is invalid! Please hit your browser's back button to return to Party On Code and try again!"
			puts "This link is invalid. Please try again!"
		else

			@link.save
					redirect_to :back
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
			redirect_to :back
	end


		

	private

	def link_params
			params.require(:link).permit(:title, :url, :subtopic_id, :user_id, :comment, :description, :image)
	end



		# custom method for before filter at the top of this page.
	def admin
		authenticate_user!
	  if current_user.admin
		  return
	  else
		  redirect_to root_url
	  end
	end



end
