class User < ApplicationRecord
  has_many :role, :through => :user_role
  has_many :user_role
  has_many :books
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :user_image
  def user_image_thumbnail
    if user_image.attached?
    user_image.variant(resize_to_limit: [50, 50])
    else
      "/assets/default_profile.jpg"
    end
  end


end
