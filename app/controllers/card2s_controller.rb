class Card2sController < ApplicationController
  require "payjp"
  before_action :authenticate_user!
  before_action :card_exist, only: [:index,:destroy,:show]

  def step4
  end

  def index
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def new 
    card = Card2.find_by(user_id: current_user.id)
    redirect_to action: "index" if card.present?
  end

  def create 
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

  def destroy 
    card = Card2.find_by(user_id: current_user.id)
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to  card_mypages_path
  end

  def show 
    card = Card2.find_by(user_id: current_user.id)
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
    @card = Card2.find_by(user_id: current_user.id)
    redirect_to action: "step4" if @card.blank?
  end

  def card_information
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end
end