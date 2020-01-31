class MypagesController < ApplicationController
  before_action :set_info
  
  def index
  end

  def profile
  end

  def edit
    render :profile
  end
  
  def identification 
  end
  
  def logout
  end

  def card
    @card = Card2.find_by(user_id: current_user.id)
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def set_info
    @user = current_user
    @parents = Category.roots.order("id ASC").limit(13)
  end

end
