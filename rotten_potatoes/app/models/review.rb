class Review < ApplicationRecord
  belongs_to :movies, optional: true
  belongs_to :user, optional: true
end
