
class CreateBiddingTables < ActiveRecord::Migration[5.1]
  def change
    create_table :bidding_tables do |t|
      t.integer :auction_id
      t.integer :prod_id
      t.string :time
      t.float :biding_price
      t.integer :bidder_id

      t.timestamps
    end
  end
end
