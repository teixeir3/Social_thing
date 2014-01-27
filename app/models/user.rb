# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  email_token     :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_digest, :session_token
  attr_reader :password

  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  has_many :owned_circles, class_name: "FriendCircle", foreign_key: :owner_id
  has_many :friends, through: :owned_circles, source: :members


  has_many :memberships, class_name: "FriendCircleMembership", foreign_key: :member_id, primary_key: :id

  has_many :circles, through: :memberships, source: :friend_circle

  has_many(
    :authored_posts,
    class_name: "Post",
    foreign_key: :author_id,
    primary_key: :id
  )

  def password=(secret)
      @password = secret
      self.password_digest = BCrypt::Password.create(secret)
    end

    def is_password?(secret)
        BCrypt::Password.new(self.password_digest).is_password?(secret)
    end

    def reset_session_token!
      self.session_token = self.class.generate_session_token
      self.save!
    end


    def self.generate_session_token
      SecureRandom.urlsafe_base64(16)
    end

    def generate_activation_token
      self.activation_token = SecureRandom.urlsafe_base64(16)
    end

    def self.find_by_credentials(email, secret)
      current_user = User.find_by_email(email)

      return nil unless current_user
      current_user.is_password?(secret) ? current_user : nil

    end

    def ensure_session_token
      self.session_token ||= User.generate_session_token
    end
end
