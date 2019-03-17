class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.date :date
      t.time :check_in
      t.time :check_out
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
