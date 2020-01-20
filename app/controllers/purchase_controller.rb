class PurchaseController < ApplicationController

  def index
    @user = current_user
    card = Card2.find_by(user_id: current_user.id)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def done
    @user = current_user
    card = Card2.find_by(user_id: current_user.id)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end


  def pay
    # product = Product.find(card_params[:product_id]) #商品が出来てから解放
    card = Card2.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    # amount:  product.price,    商品が出来てから解放
    customer:  card.customer_id, 
    currency:  'jpy'
  )
  redirect_to action: 'done' 
  end

  private

  def card_params
    params.permit('payjp-token',:product_id)
  end
  

end
