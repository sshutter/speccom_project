class CreateMarketplaces < ActiveRecord::Migration[7.0]
  def change
    create_table :marketplaces do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
