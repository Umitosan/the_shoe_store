require "spec_helper"

describe Inventory do

  it { should belong_to(:store) }
  it { should belong_to(:brand) }

  it ("finds a single RECORD from the INVENTORIES table") do
    brand1 = Brand.create({:name => "adidas", :price => "59.99"})
    store1 = Store.create({:name => "footlocker", :brand_ids => [brand1.id]})
    found_inv_record = Inventory.all.find_inv_record(store1.id, brand1.id)
    expect(found_inv_record[0].brand_id).to(eq(brand1.id))
  end

end
