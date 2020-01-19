class PurchaseController < ApplicationController

  def index
    @user = current_user
    card = Card2.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card2_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def done
    @user = current_user
    card = Card2.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card2_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end

  end

  def pay
    card = Card2.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount:  13500,    #仮置き、多分@product.price的なものになる
    customer:  card.customer_id, 
    currency:  'jpy'
  )
  redirect_to action: 'done' 
  end

end
