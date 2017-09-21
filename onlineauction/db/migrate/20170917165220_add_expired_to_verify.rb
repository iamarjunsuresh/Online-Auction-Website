class AddExpiredToVerify < ActiveRecord::Migration[5.1]
  def change
    add_column :verifies, :expired, :integer
  end
end
