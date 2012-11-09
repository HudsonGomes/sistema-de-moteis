class CreateTableAdministradores < ActiveRecord::Migration
  def up
    create_table :administradores do |t|
      t.string :nome, :null => false
      t.string :cpf, :null => false
      t.string :login, :null => false
      t.string :senha_salt, :null => false
      t.string :senha_hash, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :administradores
  end
end

