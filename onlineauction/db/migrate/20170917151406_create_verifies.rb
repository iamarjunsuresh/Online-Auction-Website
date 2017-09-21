class CreateVerifies < ActiveRecord::Migration[5.1]
  def change
    create_table :verifies do |t|
      t.integer :userid
      t.string :hash

      t.timestamps
    end
  end
end
