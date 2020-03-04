class User < ActiveRecord::Base
  has_many :tutee_searches
  has_many :tutor_searches
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.update_bio(id, bio_text)
    user = User.find_by(id: id)
    user.update(bio: bio_text)
  end
end