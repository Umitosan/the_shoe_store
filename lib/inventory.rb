class Inventory < ActiveRecord::Base
  belongs_to(:store)
  belongs_to(:brand)

  # this scope method helps us return a single inventory entry between a store and brands
  scope(:find_inv_record, -> (st_id, br_id) do
    where({:store_id => st_id, :brand_id => br_id})
  end)
  
end
