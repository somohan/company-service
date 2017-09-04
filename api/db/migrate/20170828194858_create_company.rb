class CreateCompany < ActiveRecord::Migration[5.1]
  def up
    create_table :companies do |t|
      t.integer :cvr
      t.string :name
      t.string :address
      t.string :city
      t.string :countryCode
      t.string :phoneNumber
    end
  end

  def down
    drop_table :companies
  end
end
