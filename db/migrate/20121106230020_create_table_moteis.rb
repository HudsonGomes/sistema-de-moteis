class CreateTableMoteis < ActiveRecord::Migration
  def up
	create_table :moteis do |t|
		t.string :nome, :limit => 100, :null => false
		t.string :endereco, :limit => 100, :null => false
		t.string :endnumero, :limit => 6
		t.string :endcomplemeto, :limit => 100
		t.string :cidade, :limit => 100, :null => false
		t.string :uf, :precision => 2, :null => false
		t.string :telefone1, :limit => 20
		t.string :telefone2, :limit => 20
		t.float :latitude, :null => false
		t.float :longitude, :null => false

		t.timestamps
	end
  end

  def down
	drop_table :moteis
  end
end
