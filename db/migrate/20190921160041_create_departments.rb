class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.integer :name, default: 0

      t.timestamps
    end
  end
end
