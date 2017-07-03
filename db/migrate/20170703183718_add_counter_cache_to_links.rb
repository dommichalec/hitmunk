class AddCounterCacheToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :upvotes_count, :integer, default: 0, null: false
  end
end
