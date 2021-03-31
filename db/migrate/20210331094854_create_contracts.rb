class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.integer :number
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
