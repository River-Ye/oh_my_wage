class ChangeDateTypeToSalary < ActiveRecord::Migration[5.2]
  def change
    change_column :salaries, :date, :datetime
  end
end