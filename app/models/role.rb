class Role < ApplicationRecord
  has_many :users , :through => :user_role
  has_many :user_role
end
