require "spec_helper"

describe Store do

  it { should have_many(:brands) }
  it { should have_many(:inventories) }
  it { should have_many(:brands).through(:inventories) }

### VALIDATION
  it ("capitalizes the store name before save") do
    store1 = Store.new({:name => "footlocker"})
    store1.save
    expect(store1.name).to(eq("Footlocker"))
  end
###============

end
