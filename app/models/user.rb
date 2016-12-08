class User < ApplicationRecord
  has_many :questions, foreign_key: :author_id
  has_many :answers
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id
  attr_accessor :password
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, :presence => true, :uniqueness => true, :length => {:in=>3..20}
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create
  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end
  def self.authenticate(email="", login_password="")
      EMAIL_REGEX.match(email)
      user = User.find_by_email(email)
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
end
