
class CreateAuctionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :auction_items do |t|
      t.integer :auction_id
      t.integer :prod_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
