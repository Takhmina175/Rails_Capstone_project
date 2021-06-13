class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article 

  validates :votes, uniqueness: true
end
