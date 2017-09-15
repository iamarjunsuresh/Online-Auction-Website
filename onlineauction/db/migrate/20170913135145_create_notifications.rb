
class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :recieve_id
      t.string :message
      t.string :time

      t.timestamps
    end
  end
end
