class AddColumnAtivoInMotel < ActiveRecord::Migration
  def up
    add_column :moteis, :ativo, :boolean
  end

  def down
    remove_column :moteis, :ativo
  end
end
