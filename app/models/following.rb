class Following < ActiveRecord::Base
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"

  validates_uniqueness_of :from_user_id, :scope => :to_user_id
end
