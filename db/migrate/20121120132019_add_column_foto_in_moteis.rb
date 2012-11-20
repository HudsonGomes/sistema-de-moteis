class AddColumnFotoInMoteis < ActiveRecord::Migration
  def up
    add_attachment :moteis, :foto
  end

  def down
    remove_attachment :moteis, :foto
  end
end
