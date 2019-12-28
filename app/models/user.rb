class User < ApplicationRecord
  has_many :sns_credentials, dependent: :destroy # oauth認証テーブル
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable,omniauth_providers: [:facebook, :google_oauth2] #oauth用モジュール
  
  
  def self.find_oauth(auth)        #facebookとgoogleからuid
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)
    # binding.pry
    if snscredential.present?       #sns登録のみ完了してるユーザー
      user = User.find_by(id: snscredential.user_id)
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          # snsの情報
          # binding.pry => auth.infoとかで確認 
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
    sns = snscredential
      # binding.pry

    else  #sns登録 未
      user = User.find_by(email: auth.info.email)
      if user.present?  #会員登録 済
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )

      else  #会員登録 未
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        # binding.pry
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
        # binding.pry
        
      end
    end
    # binding.pry
    # hashでsnsのidを返り値として保持しておく
    return { user: user , sns_id: sns.id }
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
