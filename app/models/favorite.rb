class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :lunch
  counter_culture :lunch
  validates :user_id, presence: true
  validates :lunch_id, presence: true
end
