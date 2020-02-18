class User < ApplicationRecord
  has_many :sns_credentials, dependent: :destroy 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable,omniauth_providers: [:facebook, :google_oauth2] #oauth用モジュール
  
  def self.find_oauth(auth)        
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)
    if snscredential.present?       
      user = User.find_by(id: snscredential.user_id)
      unless user.present? 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email)
      end

    else  
      user = User.find_by(email: auth.info.email)
      if user.present?  
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id)
      else  

        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email)
        sns = SnsCredential.create(
          uid: uid,
          provider: provider)

      end
    end
    return { user: user , sns: sns }

  end

  has_many :comments ,dependent: :destroy
  has_many :goods ,dependent: :destroy
  has_many :sellitems, dependent: :destroy
  has_many :buyitems
  has_many :card2s
  has_many :likes, dependent: :destroy

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
