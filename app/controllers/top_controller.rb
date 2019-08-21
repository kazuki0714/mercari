class TopController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
    @items = Item.paginate(page: params[:page], per_page: 20)

  end
end
