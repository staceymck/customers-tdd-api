class Api::V1::OrdersController < ApplicationController

  def index
    @orders = Order.all
    render json: @orders
  end

  def create
    @order = Order.create(order_params)
    if @order.valid?
      render json: @order, status: 201
    else
      render json: @order.errors, status: 422
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    render status: 204
  end

  private
  def order_params
    params.require(:order).permit(:item_name, :customer_id)
  end
end
