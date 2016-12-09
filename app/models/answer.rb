class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, dependent: :destroy

  has_many  :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy
end
