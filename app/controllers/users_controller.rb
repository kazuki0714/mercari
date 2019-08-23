class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def sell_history
  @current_user = User.find_by(id: session[:user_id])
  @items=Item.joins(:users).where(id: @current_user.id)
  @cart=Cart.joins(:items).where(items: {id: params[:id]})
  render("users/nologin")
  end

end
