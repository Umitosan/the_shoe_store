require "spec_helper"

describe Brand do

  it { should have_many(:stores) }
  it { should have_many(:inventories) }
  it { should have_many(:stores).through(:inventories) }

end
