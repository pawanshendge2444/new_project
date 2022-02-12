class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  
  has_many :comments, :as => :commentable
  has_many :shops, dependent: :destroy

  
  has_many :likes, dependent: :destroy

end
