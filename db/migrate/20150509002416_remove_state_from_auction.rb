class RemoveStateFromAuction < ActiveRecord::Migration
  def change
    remove_column :auctions, :state, :string
  end
end
