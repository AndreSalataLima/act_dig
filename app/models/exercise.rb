class Exercise < ApplicationRecord
  belongs_to :session
  has_one :sensor
  
end
