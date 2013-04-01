class AddPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal, :precision => 5, :default => 0
  end
end
