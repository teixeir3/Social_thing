# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
  attr_accessible :post_id, :url

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )
end
