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

require 'test_helper'

class FriendCircleMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
