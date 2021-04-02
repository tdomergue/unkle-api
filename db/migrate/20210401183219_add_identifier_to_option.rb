class AddIdentifierToOption < ActiveRecord::Migration[6.1]
  def change
    add_column :options, :identifier, :string
  end
end
