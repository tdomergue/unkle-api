class RemoveOptionsFromOption < ActiveRecord::Migration[6.1]
  def change
    remove_column :options, :options, :integer, array: true
  end
end
