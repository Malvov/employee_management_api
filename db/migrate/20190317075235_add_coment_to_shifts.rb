class AddComentToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :comment, :text
  end
end
