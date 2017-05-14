require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# Store.all.each do |s|
#   s.destroy
# end
# Inventory.all.each do |i|
#   i.destroy
# end
# Brand.all.each do |b|
#   b.destroy
# end

get "/" do
  @all_stores = Store.all
  @all_brands = Brand.all
  erb :index
end

post "/create_store" do
  store_name = params.fetch('store_name')
  @new_store = Store.new(name: store_name)
  if @new_store.save()
    redirect "/"
  else
    @new_store
    @all_brands = Brand.all
    @all_stores = Store.all
    erb :index
  end
end

post "/create_brand" do
  brand_name = params.fetch('brand_name')
  brand_price = params.fetch('brand_price')
  @new_brand = Brand.new(name: brand_name, price: brand_price)
  if @new_brand.save()
    redirect "/"
  else
    @new_brand
    @all_brands = Brand.all
    @all_stores = Store.all
    erb :index
  end
end


### STORE_HOME ###
get "/stores/:store_id" do
  store_id = params.fetch("store_id").to_i
  @found_store = Store.find_by(id: store_id)
  @all_brands = Brand.all
  erb :store_home
end

patch "/stores/rename/:store_id" do
  store_id = params.fetch("store_id").to_i
  new_store_name = params.fetch("new_name")
  @found_store = Store.find_by(id: store_id)
  @found_store.update(name: new_store_name)
  redirect "/stores/#{store_id}"
end

delete "/stores/delete/:store_id" do
  store_id = params.fetch("store_id").to_i
  found_store = Store.find_by(id: store_id)
  found_store.delete
  redirect "/"
end

patch "/stores/add_brands/:store_id" do
  store_id = params["store_id"].to_i
  selected_brand_ids = params['brand_ids']
  if (selected_brand_ids != nil)
    selected_brand_ids.each do |brand_id|

      Inventory.create({:store_id => store_id, :brand_id => brand_id.to_i})
    end
  end
  redirect("/stores/#{store_id}")
end

delete "/stores/remove_brands/:store_id" do
  store_id = params["store_id"].to_i
  selected_brand_ids = params['brand_ids']
  if (selected_brand_ids != nil)
    selected_brand_ids.each do |brand_id|
      found_inventory_record = Inventory.all.find_inv_record(store_id, brand_id.to_i)
      found_inventory_record[0].delete
    end
  end
  redirect("/stores/#{store_id}")
end
####################
