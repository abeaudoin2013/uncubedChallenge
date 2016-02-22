class User < ActiveRecord::Base
	validates_presence_of :email, :password
	validates_uniqueness_of :email
	validates_presence_of :password_confirmation, on: :create
	validates_confirmation_of :password

	has_many :lists
end
