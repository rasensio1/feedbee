class FollowChanger
  def self.create(user, url)
    UserFollow.create(user_id: user.id,
                     followable_id: followable_id(url),
                     followable_type: type(url))
  end
  
  def self.destroy(user, url)
    UserFollow.where(user_id: user.id)
              .where(followable_id: followable_id(url))
              .destroy_all
  end

  private

  def self.followable_id(url)
    Place.find_by(slug: slug(url)).id
  end

  def self.type(url)
    follow_params(url).fourth.singularize.capitalize
  end

  def self.slug(url)
    follow_params(url).last
  end

  def self.follow_params(url)
    url.split("/")
  end
end

