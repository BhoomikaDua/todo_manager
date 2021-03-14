class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render plain: User.all.map{ |user| user.display_user_info}.join("\n")
  end

  def create
    name= params[:name]
    email=params[:email]
    password=params[:password]
    new_user = User.create!(
      name:name,
      email:email,
      password:password
    )
    response_text = "New user is created with id #{new_user.id}"
    render plain: response_text
  end
end
