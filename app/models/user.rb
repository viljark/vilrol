class User < ActiveRecord::Base
  validates :username, :hashed_password, :email, :presence => true
end
