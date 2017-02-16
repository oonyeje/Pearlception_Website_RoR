class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.column :total, :integer , :null => false
      t.column :grade1, :integer
      t.column :grade2, :integer
      t.column :grade3, :integer
      t.column :grade4, :integer
      t.column :grade5, :integer
      t.column :grade6, :integer
      t.column :grade7, :integer
      t.column :grade8, :integer
      t.column :grade9, :integer
      t.column :grade10, :integer
      t.integer :machine_id
      t.integer :run_id

      t.timestamps
    end
    add_index :results, :machine_id
    add_index :results, :run_id
  end
end
