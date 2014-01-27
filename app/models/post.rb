# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :author_id, :body

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :links,
    class_name: "Link",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :post_shares,
    class_name: "PostShare",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :friend_circles,
    through: :post_shares,
    source: :friend_circle
  )
end
