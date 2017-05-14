require "spec_helper"

describe Inventory do

  it { should belong_to(:store) }
  it { should belong_to(:brand) }

  it ("finds a single RECORD from the INVENTORIES table") do
    store1 = Store.new({:name => "footlocker"})
    store1.save
    brand1 = Brand.new({:name => "adidas", :price => '59.99'})
    brand1.save
    Inventory.create({:store_id => store1.id, :brand_id => brand1.id})
    found_inv_record = Inventory.all.find_inv_record(store1.id, brand1.id)
    expect(found_inv_record[0].brand_id).to(eq(brand1.id))
  end

  it ("doesn't assign a brand if the brand isn't unique to the store") do
    store1 = Store.new({:name => "footlocker"})
    store1.save
    brand1 = Brand.new({:name => "adidas", :price => '59.99'})
    brand1.save
    Inventory.create({:store_id => store1.id, :brand_id => brand1.id})
    Inventory.create({:store_id => store1.id, :brand_id => brand1.id})
    found_inv_records = Inventory.all.find_inv_record(store1.id, brand1.id)
    expect(found_inv_records.length).to(eq(1))
  end



end
