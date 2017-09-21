class AddDateToVerify < ActiveRecord::Migration[5.1]
  def change
    add_column :verifies, :date, :datetime
  end
end
