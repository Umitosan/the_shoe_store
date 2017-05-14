class Brand < ActiveRecord::Base
  has_many(:inventories)
  has_many(:stores, through: :inventories)

  before_save(:capitalize_name)
  before_save(:round_price)

  validate(:brand_unique?)
  validate(:brand_name?)
  validate(:brand_price?)
  validates(:name, {:presence => true, :length => { :maximum => 100 }})
  validates(:price, {:presence => true, :length => { :maximum => 10 }})

  def capitalize_name
    name.capitalize!
  end

  def brand_name?
    if name.empty?
      errors.add(:name, "Don't forget a brand name!")
    end
  end

  def brand_price?
    if price.empty?
      errors.add(:price, "Don't forget a brand price!")
    end
  end

  def brand_unique?
    if Brand.where(:name => name.capitalize).exists?
      errors.add(:name, "That brand already exists!")
    end
  end

  def round_price
    self.price = ('$' + ('%.2f' % self.price))
    self.price
  end

end
