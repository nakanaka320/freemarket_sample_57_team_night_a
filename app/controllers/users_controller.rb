class UsersController < ApplicationController
   def index
   end

   def new
    @user = User.new
   end

   def create
    # binding.pry
    @user = User.new(user_params)
    @user.save.errors.messages
   end

   private
   def user_params
     params.require(:user).permit(:fullname, :first_name, :last_name, :cards, :password, :E_mail, :birth, :phone_number, :comment, :good, :sellitem, :buyitem)
   end
end