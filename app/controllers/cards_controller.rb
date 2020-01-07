class CardsController < ApplicationController
  require "payjp"
  before_action :card_exist, only: [:index,:pay,:destroy,:show]

  def step4
  end

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjpToken])
    if @card.save
      redirect_to action: "index"
    else
      redirect_to action: "create"
    end
  end

  

  def destroy #PayjpとCardのデータベース削除
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #CardのデータをPayjpに送り情報を取り出す
    card = Card.where(user_id: current_user.id).first
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
    @card = Card.where(user_id: current_user.id).first
    binding.pry
    redirect_to action: "step4" if @card.blank?
  end
end