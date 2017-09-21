class RenameHash < ActiveRecord::Migration[5.1]
  def change
rename_column :verifies, :hash, :code
  end
end
