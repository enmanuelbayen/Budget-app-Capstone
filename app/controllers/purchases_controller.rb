class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchases = Purchase.all
    @group = Group.find(params[:group_id])
  end

  def new
    @purchase = Purchase.new
    @group = Group.find(params[:group_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author = current_user
    @purchase.groups << Group.find(params[:group_id])
    if @purchase.save
      redirect_to group_purchases_path(params[:group_id])
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end
end
