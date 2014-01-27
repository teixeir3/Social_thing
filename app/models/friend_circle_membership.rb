# == Schema Information
#
# Table name: friend_circle_memberships
#
#  id                :integer          not null, primary key
#  friend_circles_id :integer
#  member_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :friend_circles_id, :member_id

  belongs_to :friend_circle, class_name: "FriendCircle", foreign_key: :friend_circles_id
  belongs_to :member, class_name: "User", foreign_key: :member_id

end
