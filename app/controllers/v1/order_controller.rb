module V1
  class OrderController < ApplicationController
    skip_before_action :authenticate, only: [:create]

    def create
      params.require(:name)
      params.require(:quantity)
      params.require(:milk)
      params.require(:size)
      params.require(:payment)
      @order = Order.new(user_param)
      display('create')
    end

    def destroy
      params.require(:id)
      render json: Order.delete(params[:id])
    end

    def update
      params.require(:id)
      @order = Order.find(params[:id])
      @order.attributes = user_param
      display('update')
    end

    def show
      params.require(:id)
      if Order.exists?(params[:id])
        render json: Order.find(params[:id])
      else
        render json: { error: 'cannot find order' }, status: :unprocessable_entity
      end
    end

    private

    def display(action)
      if @order.save
        response.header['Location'] = "http://localhost:3000/v1/order/#{@order.id}"
        render json: @order
      else
        render json: { error: "could not #{action} order" }, status: :unprocessable_entity
      end
    end

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
