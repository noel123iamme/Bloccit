class AddEmailPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_favorites, :boolen, default: true
  end
end
