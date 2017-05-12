require "spec_helper"

describe Store do

  it { should have_many(:brands) }
  it { should have_many(:inventories) }
  it { should have_many(:brands).through(:inventories) }

### CALLBACK
  it ("capitalizes the store name before save") do
    store1 = Store.new({:name => "footlocker"})
    store1.save
    expect(store1.name).to(eq("Footlocker"))
  end
###============

  it ("adds a brand to a store") do
    brand1 = Brand.create({:name => "adidas", :price => "59.99"})
    store1 = Store.create({:name => "footlocker", :brand_ids => [brand1.id]})
    expect(store1.brands).to(eq([brand1]))
  end

  it ("checks for a store name to exist") do
    store1 = Store.new({:name => ""})
    store1.save()
    expect(store1.errors.any?).to(eq(true))
  end

end
