class AddColumnEmailInAdministradores < ActiveRecord::Migration
  def up
    add_column :administradores, :email, :string
  end

  def down
    remove_column :administradores, :email
  end
end
