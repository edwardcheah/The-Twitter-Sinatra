class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets, foreign_key: :author_id
end
