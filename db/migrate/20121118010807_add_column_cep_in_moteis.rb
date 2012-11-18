class AddColumnCepInMoteis < ActiveRecord::Migration
  def up
    add_column :moteis, :cep, :string
  end

  def down
    remove_column :moteis, :cep
  end
end
