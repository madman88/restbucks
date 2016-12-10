module V1
  class OrderController < ApplicationController

    def create
        @order = Order.new(user_param)
        if @order.save
          render json: @order, serializer: V1::OrderSerializer, root: nil
        else
          render json: { error: t('user_create_error') }, status: :unprocessable_entity
        end
    end

    def destroy
      render json: Order.delete(params[:id]), serializer: V1::OrderSerializer, root: nil
    end

    def update
      #
    end

    def show
      render json: Order.find(params[:id]), serializer: V1::OrderSerializer, root: nil
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
