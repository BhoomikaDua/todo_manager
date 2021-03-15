class User < ApplicationRecord
  has_secure_password
  has_many :todos
  def display_user_info
    "#{id}. #{name} #{email}"
  end
end
