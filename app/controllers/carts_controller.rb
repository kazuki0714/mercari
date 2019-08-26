class CartsController < ApplicationController
before_action :current_cart
before_action :setup_cart_item!, only: [:add]



def new
@item=Item.find_by(item_id: params[:item_id])
end

def in
    @cart_item = @cart.cart_items.build(item_id: params[:item_id], quantity: params[:quantity])
    @cart_item.save
    flash[:notice]="商品情報がカートに追加されました。"
    redirect_to "/carts/show"

　end

end

def show
  @cart_items = current_cart.cart_items
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

##protected

#def cart_params
#  params.require(:cart).permit(:item_id, :cart_item_id)
#end
#def item_params
#  params.require(:item).permit(:user_id, :title, :price, :stock, :description, :image, cart_items_attributes:[:quantity])
#end
private

 def setup_cart_item!
   @cart_item = @cart.cart_items.find_by(item_id: params[:item_id])
 end
 def current_cart
   if session[:cart_id]
     @cart = Cart.find(session[:cart_id])
   else
     @cart = Cart.create
     session[:cart_id] = @cart.id
     @cart
   end
 end
end
