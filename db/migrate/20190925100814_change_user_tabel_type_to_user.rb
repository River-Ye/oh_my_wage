class ChangeUserTabelTypeToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :departments, :name, :integer, default: 0
    change_column :users, :role, :integer, default: 2
    change_column :users, :gender, :integer, default: 0
    remove_column :users, :subject
  end
end
