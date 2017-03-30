class Post < ApplicationRecord
	belongs_to :user
	has_many :comment
    has_many :heart
    has_many :liking_users, through: :heart, source: :user
end
