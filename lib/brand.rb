class Brand < ActiveRecord::Base
  has_many(:inventories)
  has_many(:stores, through: :inventories)

  before_save(:capitalize_name)

  def capitalize_name
    name.capitalize!
  end

end
