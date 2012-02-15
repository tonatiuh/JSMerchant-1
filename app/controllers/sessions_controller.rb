class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    load_order
    @order.update_attributes(:user => @user)
    flash[:notice] = "Logged in as #{@user.name}"
    redirect_back_or(root_path)
  end

  def destroy
    session[:user_id] = nil
    session[:order_id] = nil
    redirect_to root_path, :notice => "Goodbye!"
  end
end
