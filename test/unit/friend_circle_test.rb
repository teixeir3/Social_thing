# == Schema Information
#
# Table name: friend_circles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FriendCircleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
