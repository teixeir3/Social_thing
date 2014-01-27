# == Schema Information
#
# Table name: post_shares
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  circle_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostShare < ActiveRecord::Base
  attr_accessible :post_id, :circle_id

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )

  belongs_to(
    :friend_circle,
    class_name: "FriendCircle",
    foreign_key: :circle_id,
    primary_key: :id
  )
end
