class UsersController < ApplicationController
  def index
    render plain: User.all.map{ |user| user.display_user_info}.join("\n")
  end
end
