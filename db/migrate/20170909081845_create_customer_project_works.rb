class CreateCustomerProjectWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_project_works do |t|
      t.integer :customer_id
      t.integer :customer_project_id
      t.string  :name
      t.integer :price
      t.timestamps
    end
  end
end
