class CreateCustomerProjectWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_project_works do |t|

      t.timestamps
    end
  end
end
