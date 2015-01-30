class UsersController < ApplicationController
# added a before filter here to ensure that users can only edit and destroy their own profiles(unless they are an administrator)
# before_action :authenticate_user!
before_action :authernticate_user!	
before_filter :correct_user, only: [:edit, :update, :destroy]


	# basic CRUD functionality
		def index
			@users = User.all
		end

	def show
		@user = User.find(params[:id])
	end

		# def new
		# 	@user = User.new
		# end

		# def create
		# 	@user = User.new(user_params)

		# 	if @user.save
		# 		redirect_to users_path
		# 	else
		# 		render :new
		# 	end
		# end

		# def edit
		# 	@user = User.find(params[:id])
		# end

		# def update

		# 	@user = User.find(params[:id])

		# 	if @user.update_attributes(user_params)
		# 		redirect_to users_path
		# 	else 
		# 		render "edit"
		# 	end
		# end
		
		# def destroy
		# 	@user = User.find(params[:id])
		# 	@user.destroy
		# 	redirect_to users_path
		# end

		

		private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirm)
		end

		# because we're using devise, it would be more complicated to add functions and before filters to the application controller(because devise generates many of its own controllers for the gem to work), so we are adding them in the private methods here.
		def correct_user
			authenticate_user!
			unless @user == current_user || current_user.admin?
				redirect_to (root_path)
				flash[:alert]
			end
		end

		def require_login
			authenticate_user!
		end



end
