class AddressesController < ApplicationController
  before_filter :load_order

  def index
    @addresses = Address.all
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.new(params[:address])
    if @address.save
      flash[:notice] = "Successfully added an address."
      redirect_back_or order_path(@order)
    else
      render :action => 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(params[:address])
      redirect_to @address, :notice  => "Successfully updated address."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_url, :notice => "Successfully destroyed address."
  end
end
