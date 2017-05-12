class Store < ActiveRecord::Base
  has_many(:inventories)
  has_many(:brands, through: :inventories)

  before_save(:capitalize_name)
  validate(:store_name?)
  # validates(:description, {:presence => true, :length => { :maximum => 50 }})

  def capitalize_name
    name.capitalize!
  end

  def store_name?
    if self.name.empty?
      errors.add(:name, "Don't forget a store name!")
    end
  end

end
