class CreateTableSugestoes < ActiveRecord::Migration
  def up
    create_table :sugestoes do |t|
      t.string :nome, :null => false
      t.string :email, :null => false
      t.text :mensagem, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :sugestoes
  end
end
