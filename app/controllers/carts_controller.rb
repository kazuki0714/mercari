class CartsController < ApplicationController
before_action :setup_cart_item!, only: [:add, :update, :delete]
before_action :current_cart

def current_cart
  if session[:cart_id]
    @cart = Cart.find(session[:cart_id])
  else
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end


def add
  if @cart_item.blank?
    @cart_item = @cart.cart_items.build(item_id: params[:item_id])
    @cart_item.quantity += params[:quantity].to_i
  end

  if  @cart_item.save
   redirect_to "/carts/show"
　end

end

def show
  @cart_items = @cart.cart_items.all
end

def create
  if  @cart_item.save
    redirect_to("/carts/complete")
  else
    render("carts/show")
  end
end

def update
  @cart_item.update(quantity: params[:quantity].to_i)
   render action: 'show'
end

def delete
  @cart_item.destroy
   render action: 'new'
end

private

def setup_cart_item!
  @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
end

private

def cart_params
  params.require(:cart).permit(:user_id, :title, :price, :stock, :description, :image,items_attributes:[:quantity])
end
def cart_items_params
  params.require(:item).permit(:user_id, :title, :price, :stock, :description, :image, cart_items_attributes:[:quantity])
end

end
end
