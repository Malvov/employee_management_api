class ChangeEmployeeColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :employees, :active, :boolean, default: false
  end
end
