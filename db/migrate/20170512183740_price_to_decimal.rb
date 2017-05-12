class PriceToDecimal < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :money)
    add_column(:brands, :price, :decimal)
  end
end
