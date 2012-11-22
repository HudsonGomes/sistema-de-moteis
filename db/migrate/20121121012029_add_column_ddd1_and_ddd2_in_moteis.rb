class AddColumnDdd1AndDdd2InMoteis < ActiveRecord::Migration
  def up
    add_column :moteis, :ddd1, :string
    add_column :moteis, :ddd2, :string
  end

  def down
    remove_column :moteis, :ddd1
    remoce_column :moteis, :ddd2
  end
end
