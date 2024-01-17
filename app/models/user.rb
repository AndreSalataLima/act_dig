class User < ApplicationRecord
  has_many :sessions
  has_many :session_histories
  
end
