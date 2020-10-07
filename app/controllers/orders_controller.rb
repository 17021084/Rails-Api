class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @order = Order.all
    render json: { message:  @order }
  end

  def create
    @order = Order.new(order_params)

    if @order.save
        OrderMailer.with(order: @order).new_order_email.deliver_now
      render json: { message: 'send successfully' } , status: :ok
    else
      render json: { message: 'false'} , status: :ok
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :phone, :message)
  end
end
