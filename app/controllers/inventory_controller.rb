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
    @results = Inventory.where("name LIKE ?", "%#{params[:query]}%")
  end

  def create
    @item = Inventory.new(inventory_params)
      if @item.save
        redirect_to @item, notice: "Item Added!"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @item = Inventory.find(params[:id])
  end

  def update
    @item = Inventory.find(params[:id])
  
    if @item.update(inventory_params)
      redirect_to inventory_path(@item), notice: "Item updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @item = Inventory.find(params[:id])
    @item.destroy
    redirect_to inventory_index_path, status: :see_other,
    alert: "Item Deleted!"
  end
end

private

  def inventory_params
    inventory_params = params.require(:inventory).
      permit(:name, 
            :price, 
            :mg_percent,
            :image_file_name,
            :number_of_stocks)
  end

    
