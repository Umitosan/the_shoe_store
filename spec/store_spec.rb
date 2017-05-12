require "spec_helper"

describe Store do

  it { should have_many(:brands) }
  it { should have_many(:inventories) }
  it { should have_many(:brands).through(:inventories) }

end
