
class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :category
      t.string :desc
      t.string :name
      t.string :image
      t.float :min_bid
      t.integer :seller_id
      t.string :auction_status
      t.integer :verified_by

      t.timestamps
    end
  end
end
