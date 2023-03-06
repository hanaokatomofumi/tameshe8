class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30}
  validates :email, presence: true, length: { maximum: 255}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  before_validation { email.downcase!}
  validates :email, uniqueness: {message: 'はすでに使用されています'}
  validates :password, length: { minimum: 6 }, presence: true

  has_secure_password

  has_many :tasks, :dependent => :destroy
end
