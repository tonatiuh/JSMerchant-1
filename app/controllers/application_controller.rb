class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  include SessionsHelper

  def load_order
    begin
      @order = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      if current_user
        @order = current_user.orders.find_or_create_by_status("unsubmitted")
      else
        @order = Order.create(:status => "unsubmitted")
      end
      session[:order_id] = @order.id
    end
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
