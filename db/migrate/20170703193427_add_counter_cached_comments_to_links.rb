class AddCounterCachedCommentsToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :comments_count, :integer, default: 0, null: false
  end
end
