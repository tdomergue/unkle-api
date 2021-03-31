class CreateContractOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :contract_options do |t|
      t.references :contract, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
