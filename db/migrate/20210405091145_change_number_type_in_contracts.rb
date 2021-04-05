class ChangeNumberTypeInContracts < ActiveRecord::Migration[6.1]
  def change
    change_column :contracts, :number, :string
  end
end
