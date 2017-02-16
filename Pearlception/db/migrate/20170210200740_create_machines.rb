class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.text :key, limit: 1000

      t.timestamps
    end
  end
end
