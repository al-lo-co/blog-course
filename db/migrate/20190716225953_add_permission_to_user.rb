class AddPermissionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :permission, :integer, default: 0, null: false
  end
end
