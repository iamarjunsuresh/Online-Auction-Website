class AddPidToAuction2 < ActiveRecord::Migration[5.1]
  def change
  	remove_column :auctions,:pid,:string
  	add_column :products,:auction_id,:integer

  end
end
