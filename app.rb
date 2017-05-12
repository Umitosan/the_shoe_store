require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

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
  erb :store_home
end

get "/brands/:brand_id" do
  erb :store_home
end
