class CreateCustomerProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_projects do |t|
      t.integer :customer_id
      t.string :name
      t.string :type
      t.integer :work_days
      t.timestamps
    end
  end
end
