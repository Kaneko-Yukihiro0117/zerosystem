class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def show
  end

  def edit
    redirect_to root_path unless user_signed_in? && current_user.id == @shop.user_id
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.valid?
      @shop.save
      redirect_to shop_path(@shop.id)
    else
      render :new
    end
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path
    else
      render action: :edit
    end
  end

  def destroy
    if @shop.destroy
      redirect_to shops_path
    else
      render shops_path
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:category_id, :store_name, :item_name, :detail, :latitude, :longitude,
                                 :image).merge(user_id: current_user.id)
  end
end
