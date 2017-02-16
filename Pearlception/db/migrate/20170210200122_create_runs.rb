class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.datetime :runDate, :null => false
      t.string :location, limit: 50
      t.string :harvest_time, limit: 50
      t.string :supplier, limit: 50
      t.string :distributor, limit: 50
      t.string :other, limit: 50
      t.integer :machine_id

      t.timestamps
    end
    add_index :runs, :machine_id
  end
end
