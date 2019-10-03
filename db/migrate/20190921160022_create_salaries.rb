class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.references :user, foreign_key: true
      t.datetime :date
      t.integer :hr, default: 1
      t.integer :hourly_wage, default: 150
      
      t.timestamps
    end
  end
end
