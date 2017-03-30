class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :post  
  has_many :heart
  has_many :comment
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :liked_posts, through: :heart, source: :post

 def likes?(post)
  #self.heart.find_by_post_id(post.id)
  Heart.where(post: post, user: self.id).first
end

end
