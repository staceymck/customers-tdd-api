class Api::V1::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    render json: @customers
  end

  def create
    @customer = Customer.create(customer_params)
    if @customer.valid?
      render json: @customer, status: 201 #Created
    else
      render json: @customer.errors, status: 422 #Unprocessable Entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    render status: 204 #No Content, but successful request
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :age, :phone_number)
  end
end
