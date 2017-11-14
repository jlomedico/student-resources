class User < ApplicationRecord
  validates :provider, presence: true

  # github
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
    end
    # User.create!(
    #   provider: auth['provider'],
    #   uid: auth['uid'],
    #   name: auth['info']['name']
    # )
  end
end
