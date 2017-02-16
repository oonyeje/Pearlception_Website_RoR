class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :Full_name, limit: 100, :null => false
      t.string :Short_name, limit: 10, :null => false
      t.column :Volume_max, :double
      t.column :Volume_min, :double
      t.column :Length_max, :double
      t.column :Length_min, :double
      t.column :Width_max, :double
      t.column :Width_min, :double
      t.column :Height_max, :double
      t.column :Height_min, :double

      t.timestamps
    end
    add_index :grades, :Short_name, unique: true
  end
end
