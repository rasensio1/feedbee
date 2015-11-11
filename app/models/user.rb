class User < ActiveRecord::Base
  validates :name, :uid, presence: true
  has_many :user_follows

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash.uid)
    user.update_attributes(
      oauth_token: auth_hash.credentials.token,
      name:        auth_hash.info.name
    )
    user.save!
    user
  end
end
