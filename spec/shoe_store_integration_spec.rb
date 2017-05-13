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
    click_button("Save Brand")
    expect(page).to(have_content("Nike"))
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

end
