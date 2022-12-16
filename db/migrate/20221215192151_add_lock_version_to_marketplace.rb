class AddLockVersionToMarketplace < ActiveRecord::Migration[7.0]
  def change
    add_column :marketplaces, :lock_version, :integer
  end
end
