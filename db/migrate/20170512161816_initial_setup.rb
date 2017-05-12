class InitialSetup < ActiveRecord::Migration[5.1]
  def change

    create_table(:stores) do |t|
      t.column(:name, :text)
    end

    create_table(:inventories) do |t|
      t.column(:store_id, :integer)
      t.column(:brand_id, :integer)
      t.column(:date, :date)
    end

    create_table(:brands) do |t|
      t.column(:name, :text)
      t.column(:price, :decimal)
    end

  end
end
