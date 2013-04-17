class Notifier < ActionMailer::Base
  default :from => "kgtong1992@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order
    @url = products_url(:host => 'localhost') 
    mail :to => "fjfanchenwu@163.com", :subject => "order"
  end

end
