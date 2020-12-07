class FurimasController < ApplicationController
  def index
    @items = Item.order(id: :DESC)
  end
end
