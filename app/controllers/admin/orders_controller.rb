class Admin::OrdersController < AdminController
  def index
    @orders = Order.order('id desc')
  end

  def destroy
    @order = Order.find params[:id]
    @order.destroy
    redirect_to :back
  end
end