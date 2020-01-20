class CardsController < ApplicationController
  def step4
    @card = Card.new
    @card = current_user
   end

   def create
   @card = Card.new(card_params)
   if @card.save
    redirect_to step_complet_users_path, notice: '登録が完了しました'
  else
    redirect_to  step4_cards_path
  end
   end

   private
   def card_params
     params.require(:card).permit(
       :number,
       :exp_month,
       :exp_year,
       :cvc)
    end
end
