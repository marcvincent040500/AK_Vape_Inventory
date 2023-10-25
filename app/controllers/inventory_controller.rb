class InventoryController < ApplicationController
  def index
    @items = Inventory.all
  end

  def show
    @item = Inventory.find(params[:id])
    @mg = @item.mg_percent
    @name = @item.name
  end

  def new
    @item = Inventory.new
  end

  def search
    @item = Inventory.find(params[:id])
    @name = @item.name
    search_query = @name
    @search_results = @item.where("name LIKE ?", "%#{search_query}%")
  end

  def create
    @item = Inventory.new(inventory_params)
      if @item.save
        redirect_to @item, notice: "Item Added!"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @item = Inventory.find(params[:id])
    @item.destroy
    redirect_to root_url, status: :see_other,
    alert: "Item Deleted!"
  end
end

private

  def inventory_params
    inventory_params = params.require(:inventory).
      permit(:name, 
            :price, 
            :mg_percent)
  end

    
