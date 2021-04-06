class AddUsersToContractOption < ActiveRecord::Migration[6.1]
  def change
    add_column :contract_options, :options, :integer, array: true, default: []
  end
end
