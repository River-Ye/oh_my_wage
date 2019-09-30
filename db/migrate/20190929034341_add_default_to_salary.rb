class AddDefaultToSalary < ActiveRecord::Migration[5.2]
  def change
    change_column :salaries, :hr, :integer, default: 0
    change_column :salaries, :hourly_wage, :integer, default: 0
  end
end