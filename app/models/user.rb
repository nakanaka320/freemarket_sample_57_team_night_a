class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20]
          # telephone: "08000000000"
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end

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
