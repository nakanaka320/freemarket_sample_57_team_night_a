class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments ,dependent: :destroy
  has_many :goods ,dependent: :destroy
  has_many :sellitems
  has_many :buyitems
  has_many :cards

  validates :nickname,presence: true,
  length: { maximum: 8}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    format: {with: VALID_EMAIL_REGEX, allow_blank: true}

  validates :first_name, presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :last_name, presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday_year, presence: true
  validates :birthday_month, presence: true
  validates :birthday, presence: true
  validates :phone_number,presence: true, format: {with:/\A\d{10,11}\z/}, on: :hoge
  validates :post_number, presence: true,format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/},unless: -> { validation_context == :sample }
  validates :prefecture, {presence: true}
  validates :city, presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}, unless: -> { validation_context == :sample }
  validates :street, presence: true,unless: -> { validation_context == :sample }
end
