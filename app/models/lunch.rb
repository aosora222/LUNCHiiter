class Lunch < ApplicationRecord
  has_many   :images, dependent: :destroy
  has_many :lunches_users
  has_many :users, through: :lunches_users
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :favorites, dependent: :destroy
  has_many :iine_users, through: :favorites, source: :user

  def iine?(user)
    iine_users.include?(user)
  end

  def iine(user)
    favorites.create(user_id: user.id)
  end

  def uniine(user)
    favorites.find_by(user_id: user.id).destroy
  end
end