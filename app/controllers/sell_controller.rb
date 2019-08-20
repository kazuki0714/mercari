class SellController < ApplicationController
  def new
    @item = Item.new
  end

  def confirm
  @item = Item.new(title: params[:title],price: params[:price],stock: params[:stock],description: params[:description],image: params[:image])
  #@item = Item.new(item_params)
  render :new if @item.invalid?
  end

  def create
    #@item = Item.new(title: params[:title],price: params[:price],stock: params[:stock],description: params[:description],image: params[:image])
    @item = Item.new(item_params)
    if params[:image]
      @item.image = "#{@item.item_id}.jpg" #表示先のviewファイルへの記述　<img src="<%= "/item_images/#{@item.image}" %>">
      File.binwrite("public/item_images/#{@item.image}", params[:image].read)
    end

    if params[:back]
      format.html { render :new }
    elsif @item.save
      flash[:notice] = "出品情報が保存されました"
      redirect_to("/sell/complete")
    else
      render("sell/new")
    end
  end

  def complete
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :stock, :description, :image)
  end
end
