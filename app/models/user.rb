class User < ApplicationRecord
  has_secure_password

  has_many :questions, foreign_key: :author_id
  has_many :answers
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id
  
  validates_length_of :password, :in => 6..20, :on => :create

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_format_of :email, :with => EMAIL_REGEX, :on => :create
end
