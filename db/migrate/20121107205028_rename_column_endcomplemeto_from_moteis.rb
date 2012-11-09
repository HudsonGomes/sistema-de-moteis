class RenameColumnEndcomplemetoFromMoteis < ActiveRecord::Migration
  def up
    rename_column :moteis, :endcomplemeto, :endcomplemento
  end

  def down
    rename_column :moteis, :endcomplemento, :endcomplemeto
  end
end
