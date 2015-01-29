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
		@link = current_user.links.create(link_params)
		@object = LinkThumbnailer.generate(@link.url)
			# @link.title = object.title
			# might need to migrate a description column into link table
			# @link.description = object.description

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
