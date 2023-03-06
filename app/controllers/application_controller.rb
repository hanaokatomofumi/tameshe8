class ApplicationController < ActionController::Base
  before_action :correct_user, only: [:show]
  include SessionsHelper
  before_action :login_required

  private
  
  def login_required
    redirect_to new_session_path, flash: {alert: "ログインしてください"} unless current_user
  end
end
