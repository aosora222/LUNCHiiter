class Lunch < ApplicationRecord
  has_many   :images, dependent: :destroy
  has_many :lunches_users
  has_many :users, through: :lunches_users
  accepts_nested_attributes_for :images, allow_destroy: true

end