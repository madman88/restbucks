class OrdersController < ApplicationController
  def show
  end

  def index
    #  @orders = Order.
     render json: {:name => "David"}.to_json
  end

  def create
      @order = Order.new(user_param)
  end

  def update
  end

  private



end
