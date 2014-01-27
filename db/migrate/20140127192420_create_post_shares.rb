class CreatePostShares < ActiveRecord::Migration
  def change
    create_table :post_shares do |t|
      t.integer :post_id
      t.integer :circle_id

      t.timestamps
    end
  end
end
