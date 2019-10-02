class AddMemberProfileToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :number, :string
    add_column :users, :role, :integer, default: 2
    add_column :users, :phone, :string
    add_column :users, :gender, :integer, default: 0
  end
end
