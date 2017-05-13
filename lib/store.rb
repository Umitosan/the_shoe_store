class Store < ActiveRecord::Base
  has_many(:inventories)
  has_many(:brands, through: :inventories)

  before_save(:capitalize_name)

  validate(:store_unique?)
  validate(:store_name?)
  validates(:name, {:presence => true, :length => { :maximum => 100 }})

  def capitalize_name
    name.capitalize!
  end

  def store_name?
    if self.name.empty?
      errors.add(:name, "Don't forget a store name!")
    end
  end

  def store_unique?
    if Store.where(:name => name.capitalize).exists?
      errors.add(:name, "That store already exists!")
    end
  end

end
