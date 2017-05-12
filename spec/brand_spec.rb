require "spec_helper"

describe Brand do

  it { should have_many(:stores) }
  it { should have_many(:inventories) }
  it { should have_many(:stores).through(:inventories) }

### CALLBACK
  it ("capitalizes the brand name before save") do
    brand1 = Brand.new({:name => "puma"})
    brand1.save
    expect(brand1.name).to(eq("Puma"))
  end
###============

  it ("adds a store to brand") do
    store1 = Store.create({:name => "footlocker"})
    brand1 = Brand.create({:name => "adidas", :price => "59.99", :store_ids => [store1.id]})
    expect(brand1.stores).to(eq([store1]))
  end

  it ("checks for a brand name to exist") do
    brand1 = Brand.new({:name => ""})
    brand1.save()
    expect(brand1.errors.any?).to(eq(true))
  end

end
