class User < ApplicationRecord 
    has_many :articles, class_name: 'Article', foreign_key: 'author_id'
    has_many :votes
  
    validates :username, presence: true
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, length: { in: 2..8 }
    validates :username, format: { with: /\A[a-zA-Z0-9_]+\z/,
    message: "only use alphanumeric characters" }

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'invalid email address' } 
    validates :email, uniqueness: true
end
