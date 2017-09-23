class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :name
      t.string :pass

      t.timestamps
    end
  end
end
