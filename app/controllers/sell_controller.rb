class SellController < ApplicationController
  def new
    @item = Item.new
  end

  def confirm
  @item = Item.new(title: params[:title],price: params[:price],stock: params[:stock],description: params[:description],image: "default_item.jpg")
  render :new if @item.invalid?
  end

  def create
    @item = Item.new(title: params[:title],price: params[:price],stock: params[:stock],description: params[:description],image: "default_item.jpg")
    #@item = Item.new(item_params)
    if params[:image]
      @item.image = "#{@item.id}.jpg" #表示先のviewファイルへの記述　<img src="<%= "/item_images/#{@item.image}" %>">
      image = params[:image]
      File.binwrite("public/item_images/#{@item.image}", image.read)
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
end
