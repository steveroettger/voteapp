class User < ActiveRecord::Base
  has_many :contestant_votes
  
  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.gender = auth.extra.raw_info.gender
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
  end
  
  def can_vote_for?(contestant)
      contestant_votes.build(value: 1, contestant: contestant).valid?
  end
end
