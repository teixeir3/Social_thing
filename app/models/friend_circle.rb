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

class FriendCircle < ActiveRecord::Base
  attr_accessible :name, :owner_id

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :memberships, class_name: "FriendCircleMembership", foreign_key: :friend_circles_id
  has_many :members, through: :memberships, source: :member

end
