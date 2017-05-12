ENV["RACK_ENV"] = "test"

require "bundler/setup"
Bundler.require :default, :test
set :root, Dir.pwd
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require "capybara/rspec"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require "./app"

RSpec.configure do |config|
  config.after(:each) do
    Store.all.each do |s|
      s.destroy
    end
    Inventory.all.each do |i|
      i.destroy
    end
    Brand.all.each do |b|
      b.destroy
    end
  end
end
