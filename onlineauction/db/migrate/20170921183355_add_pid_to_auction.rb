class AddPidToAuction < ActiveRecord::Migration[5.1]
  def change
  	 add_column :auctions, :pid, :integer

  	 add_column :auctions, :status, :string


  	 add_column :auction_items,:bid_val,:string

  end
end
