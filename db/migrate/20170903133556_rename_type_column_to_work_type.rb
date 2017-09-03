class RenameTypeColumnToWorkType < ActiveRecord::Migration[5.0]
  def change
    rename_column :customer_projects, :type, :work_type
  end
end
