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


  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save
  end

  def reset_email_token!
    self.email_token = SecureRandom::urlsafe_base64(16)
    self.save

    self.email_token
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)
    return nil if user.nil?
    BCrypt::Password.new(user.password_digest).is_password?(secret) ? user : nil
  end

  def reset_password

  end

  def ensure_session_token
    self.session_token ||= self.reset_session_token
  end
end
