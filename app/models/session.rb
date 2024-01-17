class Session < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_one :session_history
  
end
