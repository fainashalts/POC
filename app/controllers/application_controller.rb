class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :admin 

  def admin
    unless current_user.admin
      redirect_to links_path
      flash[:admin] = "Must be administrator to do that!"
    end
  end
end
