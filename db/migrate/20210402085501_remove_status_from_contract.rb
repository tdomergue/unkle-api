class RemoveStatusFromContract < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :status, :string
  end
end
