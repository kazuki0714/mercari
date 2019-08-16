class SellController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(title: params[:title],price: params[:price],stock: params[:stock],description: params[:description],image: "default_item.jpg")

        if params[:image]
          @item.image = "#{@item.id}.jpg" #表示先のviewファイルへの記述　<img src="<%= "/item_images/#{@item.image}" %>">
          image = params[:image]
          File.binwrite("public/item_images/#{@item.image}", image.read)

        end

    if @item.save
      flash[:notice] = "出品情報が保存されました"
      redirect_to("/sell/complete")
    else
      render("sell/new")
    end
  end
end
