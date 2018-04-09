class Review < ApplicationRecord
  belongs_to :movies
  belongs_to :user
end
