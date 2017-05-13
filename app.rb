require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


Store.all.each do |s|
  s.destroy
end
Inventory.all.each do |i|
  i.destroy
end
Brand.all.each do |b|
  b.destroy
end


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
  @new_brand = Brand.new(name: brand_name)
  if @new_brand.save()
    redirect "/"
  else
    @new_brand
    @all_brands = Brand.all
    @all_stores = Store.all
    erb :index
  end
end

get "/stores/:store_id" do
  store_id = params.fetch("store_id").to_i
  @found_store = Store.find_by(id: store_id)
  erb :store_home
end

patch "/stores/rename/:store_id" do
  store_id = params.fetch("store_id").to_i
  new_store_name = params.fetch("new_name")
  @found_store = Store.find_by(id: store_id)
  @found_store.update(name: new_store_name)
  redirect "/stores/#{store_id}"
end
