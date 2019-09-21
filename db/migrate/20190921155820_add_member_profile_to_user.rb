class AddMemberProfileToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :number, :string
    add_column :users, :role, :string
    add_column :users, :phone, :string
    add_column :users, :subject, :string
    add_column :users, :gender, :string
  end
end
