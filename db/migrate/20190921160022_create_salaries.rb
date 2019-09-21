class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.references :user, foreign_key: true
      t.time :date
      t.integer :hr
      t.integer :hourly_wage

      t.timestamps
    end
  end
end
