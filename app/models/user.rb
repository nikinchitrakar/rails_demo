class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :post
  has_many :comment
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
