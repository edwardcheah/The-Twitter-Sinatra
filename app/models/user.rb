class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets, foreign_key: :author_id

  # a user has many follows (follows many other users)
  has_many :followings, foreign_key: :from_user_id, class_name: "Following", table_name: "followings"
  has_many :follows, source: :to_user, through: :followings

  # a user has many followers (many other users follow them)
  has_many :followed, foreign_key: :to_user_id, class_name: "Following"
  has_many :followees, source: :from_user, through: :followed

  def has_followee(other_user)
    self.followees.where(id: other_user.id).count > 0
  end

  def has_follower(other_user)
    self.followers.where(id: other_user.id).count > 0
  end
end
