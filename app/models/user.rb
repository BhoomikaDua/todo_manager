class User < ApplicationRecord
  def display_user_info
    "#{id}. #{name} #{email}"
  end
end
