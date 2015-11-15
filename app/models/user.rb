class User < ActiveRecord::Base
  validates :name, :uid, presence: true
  has_many :user_follows
  has_many :votes
  has_many :places, :through => :user_follows, 
    :source => :followable, :source_type => "Place"

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash.uid)
    user.update_attributes(
      oauth_token: auth_hash.credentials.token,
      email: auth_hash.info.email,
      name:        auth_hash.info.name
    )
    user.save!
    user
  end
end
