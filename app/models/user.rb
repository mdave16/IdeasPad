class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.provider = auth.provider
      user.avatar_url = auth.info.image
      user.username = auth.info.nickname
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end
end
