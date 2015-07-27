class OrderMailer < ActionMailer::Base
  default from: 'noreply@iricrm.ru'

  def new_order_email(order)
    @order = order
    mail(to: order.email, subject: 'Добавлена новая заявка')
  end

  def welcome_email(order)
    @order = order
    mail(to: order.email, subject: 'Ссылка на программу для массажного салона')
  end
end