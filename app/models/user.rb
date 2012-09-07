class User < ActiveRecord::Base
  has_many :evaluations, class_name: "RSEvaluation", as: :source
  
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
  
  def voted_for?(contestant)
    evaluations.where(target_type: contestant.class, target_id: contestant.id).present?
  end
end
