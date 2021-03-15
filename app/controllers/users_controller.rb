class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render plain: "hello"
  end

  def new
    render "users/new"
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email:params[:email],
      password:params[:password]
    )
    redirect_to "/"
  end

end
