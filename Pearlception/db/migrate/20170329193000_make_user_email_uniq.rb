class MakeUserEmailUniq < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :email, :string, {unique: true, null: false , default: ""}
  end
end
