module V1
  class OrderController < ApplicationController
    skip_before_action :authenticate, only: [:create]

    def create
      @order = Order.new(user_param)
      if @order.save
        response.header['Location'] = "http://localhost:3000/v1/order/#{@order.id}"
        render json: @order, serializer: V1::OrderSerializer, root: nil
      else
        render json: { error: 'could not create order' }, status: :unprocessable_entity
      end
    end

    def destroy
      render json: Order.delete(params[:id]), serializer: V1::OrderSerializer, root: nil
    end

    def update
      #
    end

    def show
      if Order.exists?(params[:id])
        render json: Order.find(params[:id]), serializer: V1::OrderSerializer, root: nil
      else
        render json: { error: 'cannot find order' }, status: :unprocessable_entity
      end
    end

    private

    def user_param
      {
        name: params[:name],
        quantity: params[:quantity],
        milk: params[:milk],
        size: params[:size],
        payment: params[:payment]
      }
    end

  end
end
