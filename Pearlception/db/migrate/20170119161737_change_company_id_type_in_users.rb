class ChangeCompanyIdTypeInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :company_id, :integer, default: -1
  end
end
