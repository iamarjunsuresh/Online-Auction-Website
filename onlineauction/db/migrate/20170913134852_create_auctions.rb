
class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.integer :admin_id
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
