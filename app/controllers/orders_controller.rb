class OrdersController < ApplicationController
  def create
    contact = Contact.find_by_code params[:code]

    if contact

      o = Order.find_by_email params[:email]

      unless o
        order = Order.new
        order.contact_id = contact.id
        order.email = params[:email]
        order.save

        OrderMailer.new_order_email(order).deliver_later
        OrderMailer.welcome_email(order).deliver_later
      end

      render json: {status: :success}
    else
      render json: {status: :error}
    end
  end
end