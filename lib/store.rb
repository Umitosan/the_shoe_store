class Store < ActiveRecord::Base
  has_many(:inventories)
  has_many(:brands, through: :inventories)

  before_save(:capitalize_name)
  validate(:store_name?)
  validates(:name, {:presence => true, :length => { :maximum => 100 }})
  validate(:unique?)

  def capitalize_name
    name.capitalize!
  end

  def store_name?
    if self.name.empty?
      errors.add(:name, "Don't forget a store name!")
    end
  end

  def unique?
    if (Store.where(:name => name.capitalize).exists? == true)
      errors.add(:name, "That store already exists!")
    end
  end

end
