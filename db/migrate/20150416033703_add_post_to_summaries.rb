class AddPostToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :post_id, :string
    add_index :summaries, :post_id
  end
end
