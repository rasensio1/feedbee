class FollowChanter
  def create(user, url)
    UserFollow.create(user_id: user.id,
                     followable_id: followable_id,
                     followable_type: type)
  end
  
  def destory(user, url)
    UserFollow.where(user_id: user.id)
              .where(followable_id: followable_id)
              .destroy_all
  end

  private

  def self.followable_id
    Place.find_by(slug: slug).id
  end

  def self.type
    follow_params.fourth.singularize.capitalize
  end

  def self.slug
    follow_params.last
  end

  def follow_params(url)
    url.split("/")
  end
end

