class ChangeUserPasswordDefaultToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :encrypted_password, :string, default: "123123"
  end
end
