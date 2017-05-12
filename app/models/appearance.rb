class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode
  belongs_to :user

  validates :rating, inclusion: { in: (1..5), message: "Rating must be between 1 and 5"}


end
