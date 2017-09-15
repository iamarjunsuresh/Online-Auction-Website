class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :addr
      t.string :gender
      t.string :type
      t.string :email
      t.string :phno
      t.integer :verified_by
      t.string :pwd
      t.string :salt

      t.timestamps
    end
  end
end
