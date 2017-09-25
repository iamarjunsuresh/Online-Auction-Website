class Renamedesc < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :desc, :description
  end
end
