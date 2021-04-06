class AddUsersToSubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :users, :integer, array: true, default: []
  end
end
