class ChangeColumnAtivoToInteger < ActiveRecord::Migration
  def up
    change_column :moteis, :ativo, :integer
  end

  def down
    change_column :moteis, :ativo, :boolean
  end
end
