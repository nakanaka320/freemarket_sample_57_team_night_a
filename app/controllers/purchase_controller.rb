class PurchaseController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @sellitem = Sellitem.find(params[:sell_id])
    card = Card2.find_by(user_id: current_user.id)
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to new_card2_path
    end
  end

  def done
    @user = current_user
    @sellitem = Sellitem.includes(:images).find(params[:sell_id])
    card = Card2.find_by(user_id: current_user.id)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end


  def pay
    @sellitem = Sellitem.find(params[:sell_id])
    card = Card2.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount:  @sellitem.price,
    customer:  card.customer_id, 
    currency:  'jpy'
  )
  redirect_to action: 'done',notice: "#{@sellitem.name}ゲットだぜ"
  end

  private

  def sellitem_params
    params.require(:sellitem).permit(:name,
                                     :text,
                                     :category_id,
                                     :price,
                                     :condition,
                                     :send_cost,
                                     :send_method, 
                                     :send_place, 
                                     :send_day, 
                                     images_attributes: [:gazou, :_destroy, :id])#, :user_id)
  end

  def card_params
    params.permit('payjp-token',:sellitem_id)
  end
  

end
