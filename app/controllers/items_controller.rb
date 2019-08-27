class ItemsController < ApplicationController
   before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def confirm
  @item = Item.new(title: params[:title],price: params[:price],stock: params[:stock],description: params[:description],image: params[:image],user_id: params[:user_id])
  #@item = Item.new(item_params)
  render :new if @item.invalid?
  end

  def create
    #item = Item.new(title: params[:title],price: params[:price],stock: params[:stock],description: params[:description],image: params[:image], user_id: params[:user_id])
    @item = Item.new(item_params)
    #@item = @user.items.create!(item_params)
    if params[:image]
      @item.image = "#{@item.item_id}.jpg" #表示先のviewファイルへの記述　<img src="<%= "/item_images/#{@item.image}" %>">
      File.binwrite("public/item_images/#{@item.image}", params[:image].read)
    end

    if params[:back]
      format.html { render :new }
    elsif @item.save
      flash[:notice] = "出品情報が保存されました"
      redirect_to("/items/complete")
    else
      render("items/new")
    end
  end

  def complete

  end

 def show
  @item = Item.find(params[:id])
 end

 def quantity
  @item = Item.find(params[:id])
  @cart_item=""
 end

 def search
  @items = Item.search(params[:search])
  if @items.brank?
    render("items/noresult")
  end
 end

  def noresult
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :title, :price, :stock, :description, :image,carts_attributes:[:quantity])
  end

end
