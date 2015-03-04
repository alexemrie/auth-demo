class SignInController < ApplicationController
  before_action :ensure_user_is_logged_in, except: [:index, :create]
  def index

  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:anything] = user.id
      redirect_to root_path, notice: 'Thanks for signing in!'
    else
      flash[:notice] = "Something went wrong!"
      render :index
    end
  end

  def need_auth

  end

  private

  def ensure_user_is_logged_in
    unless current_user
      redirect_to root_path, notice: "Sorry!"
    end
  end
end
