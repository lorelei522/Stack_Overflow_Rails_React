class Question < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :answers, dependent: :destroy 
  has_many :votes, as: :voteable, dependent: :destroy
end
