class CreateTableSuites < ActiveRecord::Migration
  def up
    create_table :suites do |t|
	t.text :descricao
	t.float :valor, :null => false
	t.string :nome, :limit => 100, :null => false
	t.integer :motel_id, :null => false	

	t.timestamps
    end
  end

  def down
    drop_table :suites
  end
end
