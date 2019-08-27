class CartsController < ApplicationController
before_action :current_cart
before_action :setup_cart_item!, only: [:add]

def new
    @item=Item.find_by(id: params[:id])
    @cart_item = @cart.cart_items.build(item_id: params[:item_id])
    @cart_item.save
    flash[:notice]="商品情報がカートに追加されました。"
    redirect_to "/carts/show"
  end


def show
  @cart_items = @cart.cart_items.all
  #@cart_items = @cart.cart_items.all
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
   render action: 'show'
end

private
def cart_params
  params.require(:cart).permit(:item_id, :cart_item_id)
end

 def setup_cart_item!
   @cart_item = @cart.cart_items.find_by(item_id: params[:item_id])
 end

 def current_cart
   if session[:cart_id]
     @cart = Cart.find(session[:cart_id])
   else
     @cart = Cart.create
     session[:cart_id] = @cart.id
     return
   end
 end
end
