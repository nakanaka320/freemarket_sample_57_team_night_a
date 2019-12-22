class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable

  has_many :comments ,dependent: :destroy
  has_many :goods ,dependent: :destroy
  has_many :sellitems
  has_many :buyitems
  # has_one :addresses

  validates :nickname, {presence: true}
  validates :email, {presence: true}
  validates :first_name, {presence: true}
  validates :last_name, {presence: true}
  validates :first_name_kana, {presence: true}
  validates :last_name_kana, {presence: true}
  validates :phone_number, presence: true,uniqueness: true,numericality:{only_integer: true}
  validates :birthday_year, {presence: true}
  validates :birthday_month, {presence: true}
  validates :birthday, {presence: true}
  validates :post_number, presence: true,numericality:{only_integer: true}
  validates :prefecture, {presence: true}
  validates :city, {presence: true}
  validates :street, {presence: true}
end
