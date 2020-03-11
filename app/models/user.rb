class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 10}

  VALID_EMAIL_REGEXP = /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP }
  VALID_NAME_REGEXP = /\A[^ -~｡-ﾟ]/

  validates :first_name, presence: true,
    format: { with: VALID_NAME_REGEXP }, length: { maximum: 10}
  validates :last_name, presence: true,
    format: { with: VALID_NAME_REGEXP }, length: { maximum: 10}
  validates :password, presence: true, length: { minimum: 7 }
  VALID_LETTER_REGEXP = /\A[\p{katakana}}&&[^ -~｡-ﾟ]]+\z/
  validates :first_kane, presence: true,
    format: { with: VALID_LETTER_REGEXP }, length: { maximum: 10}
  validates :last_kane, presence: true,
    format: { with: VALID_LETTER_REGEXP }, length: { maximum: 10}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :birthday, presence: true
  validates :profile, presence: true

  has_many :lunches_users
  has_many :lunches, through: :lunches_users
  has_many :comments
  has_many :favorites, dependent: :destroy
end
