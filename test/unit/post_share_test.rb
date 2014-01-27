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

require 'test_helper'

class PostShareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
