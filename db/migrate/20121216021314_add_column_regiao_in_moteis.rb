class AddColumnRegiaoInMoteis < ActiveRecord::Migration
  def up
    add_column :moteis, :regiao, :string
  end

  def down
    remove_column :moteis, :regiao
  end
end
