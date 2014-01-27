class CreateFriendCircleMemberships < ActiveRecord::Migration
  def change
    create_table :friend_circle_memberships do |t|
      t.integer :friend_circles_id
      t.integer :member_id

      t.timestamps
    end
  end
end
