require "spec_helper"

describe("the home page", {:type => :feature}) do

  it("adds a new store to the list") do
    visit("/")
    fill_in("store_name", :with => "Footlocker")
    click_button("Save Store")
    expect(page).to(have_content("Footlocker"))
  end
  it("adds a new store to the list") do
    visit("/")
    fill_in("brand_name", :with => "Nike")
    fill_in("brand_price", :with => 45.99)
    click_button("Save Brand")
    expect(page).to(have_content("Nike"))
  end

  it("shows an error message if no store name is given before clicking the save button") do
    visit("/")
    click_button("Save Store")
    expect(page).to(have_content("Don't forget a store name!"))
  end
  it("shows an error message if no brand name is given before clicking the save button") do
    visit("/")
    click_button("Save Brand")
    expect(page).to(have_content("Don't forget a brand name!"))
  end

  it("shows an error message for duplicate stores") do
    visit("/")
    fill_in("store_name", :with => "footlocker")
    click_button("Save Store")
    fill_in("store_name", :with => "footlocker")
    click_button("Save Store")
    expect(page).to(have_content("That store already exists!"))
  end
  it("show an error message for duplicate brands") do
    visit("/")
    fill_in("brand_name", :with => "nike")
    fill_in("brand_price", :with => 45.99)
    click_button("Save Brand")
    fill_in("brand_name", :with => "nike")
    fill_in("brand_price", :with => 45.99)
    click_button("Save Brand")
    expect(page).to(have_content("That brand already exists!"))
  end

end


describe("the selected store page", {:type => :feature}) do

  it("displays the current store name on the page") do
    visit("/")
    fill_in("store_name", :with => "Footlocker")
    click_button("Save Store")
    click_link("Footlocker")
    expect(page).to(have_content("Footlocker"))
  end
  it("renames the store") do
    visit("/")
    fill_in("store_name", :with => "Footlocker")
    click_button("Save Store")
    click_link("Footlocker")
    fill_in("new_name", :with => "dope shoes")
    click_button("Save")
    expect(page).to(have_content("Dope shoes"))
  end
  it("displays a list of all brands") do
    visit("/")
    fill_in("store_name", :with => "footlocker")
    click_button("Save Store")
    fill_in("brand_name", :with => "nike")
    fill_in("brand_price", :with => 45.99)
    click_button("Save Brand")
    click_link("Footlocker")
    expect(page).to(have_content("Nike"))
  end
  it("deletes a store") do
    visit("/")
    fill_in("store_name", :with => "footlocker")
    click_button("Save Store")
    click_link("Footlocker")
    click_button("Remove Store")
    expect(page).not_to(have_content("Footlocker"))
  end

  it("saves brand(s) to a store and diplays it in the inventory list") do
    visit("/")
    fill_in("store_name", :with => "footlocker")
    click_button("Save Store")
    fill_in("brand_name", :with => "nike")
    fill_in("brand_price", :with => 45.99)
    click_button("Save Brand")
    click_link("Footlocker")
    page.check("Nike")
    click_button("Add to Inventory")
    expect(page.find("label", :class => "green").text).to(eq("Nike - $45.99"))
  end
  it("removes brand(s) from a store's inventory") do
    visit("/")
    fill_in("store_name", :with => "footlocker")
    click_button("Save Store")
    fill_in("brand_name", :with => "nike")
    fill_in("brand_price", :with => 45.99)
    click_button("Save Brand")
    click_link("Footlocker")
    page.check("Nike")
    click_button("Add to Inventory")
    page.find("input", :class => "inv").set(true)
    click_button("Remove Brands")
    found_checkboxes = all('input[type=checkbox]')
    expect(found_checkboxes.length).to(eq(1))
  end

end
