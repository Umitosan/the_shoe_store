require "spec_helper"

describe Brand do

  it { should have_many(:stores) }
  it { should have_many(:inventories) }
  it { should have_many(:stores).through(:inventories) }

### VALIDATION
  it ("capitalizes the brand name before save") do
    brand1 = Brand.new({:name => "puma"})
    brand1.save
    expect(brand1.name).to(eq("Puma"))
  end
###============

end
