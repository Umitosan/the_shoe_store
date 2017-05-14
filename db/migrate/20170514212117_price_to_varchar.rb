class PriceToVarchar < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :decimal)
    add_column(:brands, :price, :varchar)
  end
end
