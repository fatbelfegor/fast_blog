class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :registerable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, 
  			 :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :posts
  
end
