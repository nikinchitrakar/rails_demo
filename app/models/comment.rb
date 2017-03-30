class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	validates :comment, presence: true
	belongs_to :parent,  class_name: "Comment" #-> requires "parent_id" column
    has_many   :replies, class_name: "Comment", foreign_key: :comment_id, dependent: :destroy
end
