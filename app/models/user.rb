class User < ApplicationRecord
 validates :username, presence: true, uniqueness: true
 validates :password, length: { in: 6..12 } 
 has_secure_password
  has_many :likes, dependent: :destroy

  has_one :cart, dependent: :destroy

  has_many :products, dependent: :destroy
  has_many :comments, :as => :commentable


  after_create :initialize_cart

  def initialize_cart
    Cart.create(user_id:id )
  end
end
