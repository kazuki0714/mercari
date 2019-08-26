class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def sell_history
  #@items=Item.joins(:users).where(id: current_user.id)
  @items=current_user.items.all
  @cart=Cart.joins(:items).where(items: {id: params[:id]})
  render("users/nologin")
  end


end
