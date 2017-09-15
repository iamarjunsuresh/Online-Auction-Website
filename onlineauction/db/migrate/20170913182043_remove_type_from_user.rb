class RemoveTypeFromUser < ActiveRecord::Migration[5.1]
  def change


change_table :users do |t|
  t.rename :type, :usertype
end
  end
end
