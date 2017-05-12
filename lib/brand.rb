class Brand < ActiveRecord::Base
  has_many(:inventories)
  has_many(:stores, through: :inventories)

  before_save(:capitalize_name)
  validate :brand_name?
  validates(:name, {:presence => true, :length => { :maximum => 100 }})

  def capitalize_name
    name.capitalize!
  end

  def brand_name?
    if self.name.empty?
      errors.add(:name, "Don't forget a brand name!")
    end
  end

end
