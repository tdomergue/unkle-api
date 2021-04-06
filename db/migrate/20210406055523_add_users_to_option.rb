class AddUsersToOption < ActiveRecord::Migration[6.1]
  def change
    add_column :options, :options, :integer, array: true, default: []
  end
end
