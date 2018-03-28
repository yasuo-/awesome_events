class User < ApplicationRecord
  # create_eventsに関して言うなら，
  # あるuserのid値が，Eventのowner_idカラムの値と一致するレコードを取り出します．
  has_many :create_events, class_name: 'Event', foreign_key: :owner_id
  has_many :tickets

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
    end
  end
end
