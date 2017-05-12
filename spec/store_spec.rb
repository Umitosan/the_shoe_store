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

### VALIDATIONS
  it ("doesn't save the store if it doesn't have a name") do
    store1 = Store.new({:name => ""})
    store1.save()
    expect(Store.all).to(eq([]))
  end

  it ("adds an error if store name doesn't exist") do
    store1 = Store.new({:name => ""})
    store1.save()
    expect(store1.errors.any?).to(eq(true))
  end

  it ("doesn't save the store if the name has over 100 characters") do
    store1 = Store.new({:name => "aaaaaaaaa-aaaaaaaaa-aaaaaaaaa-aaaaaaaaa-aaaaaaaaa-aaaaaaaaa-aaaaaaaaa-aaaaaaaaa-aaaaaaaaa-aaaaaaaaa-toolong"})
    store1.save()
    expect(Store.all).to(eq([]))
  end

  it ("doesn't save the store if the store name already exists") do
    store1 = Store.new({:name => "southside shoes"})
    store1.save()
    store2 = Store.new({:name => "southside shoes"})
    store2.save()
    expect(Store.all[0].name).to(eq(store1.name))
  end
###============

end
