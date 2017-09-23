class Addpidtoauction < ActiveRecord::Migration[5.1]
  def change
  	add_column :auctions,:pid,:integer
  end
end
