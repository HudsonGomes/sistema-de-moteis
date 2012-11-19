class AddColumnBairroInMoteis < ActiveRecord::Migration
  def up
    add_column :moteis, :bairro, :string
  end

  def down
    remove_column :moteis, :bairro
  end
end
