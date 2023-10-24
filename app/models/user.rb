class User < ApplicationRecord
  has_secure_password

  # as_many :reviews, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :favorite_movies, through: :favorites, source: :movie

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/ }, 
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 0, allow_blank: true}
end
