class Card2sController < ApplicationController
  require "payjp"
  before_action :card_exist, only: [:index,:destroy,:show]

  def step4
  end

  def index
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    card = Card2.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @card = Card2.new(
    user_id: current_user.id, 
    customer_id: customer.id,
    card_id: customer.default_card,
    token: params[:payjpToken])
    if @card.save
      card_information
      redirect_to step_complet_users_path
    else
      redirect_to action: "step4"
    end
  end

  def destroy #PayjpとCardのデータベース削除
    card = Card2.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to  mypages_card_path
  end

  def show #CardのデータをPayjpに送り情報を取り出す
    card = Card2.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end


  private

  def card_exist
    @card = Card2.where(user_id: current_user.id).first
    redirect_to action: "step4" if @card.blank?
  end

  def card_information
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end
end