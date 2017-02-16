class CreateOysters < ActiveRecord::Migration[5.0]
  def change
    create_table :oysters do |t|
      t.integer :run_id, :null => false
      t.string :grade, limit: 50, :null => false
      t.column :volume, :double
      t.column :length, :double
      t.column :width, :double
      t.column :height, :double
      t.integer :machine_id

      t.timestamps
    end
    add_index :oysters, :run_id
    add_index :oysters, :machine_id
  end
end
