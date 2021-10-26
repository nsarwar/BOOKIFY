class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews

  has_one_attached :book_image
  # validates :ISBN_number, format: {with: ^ISBN-/\d/ , message: "Must be valid ISBN number"}

  # has_attached_file :image, styles: { :book_index => "250x350>", :book_show => "325x475>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  #
  # has_attached_file :image
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
