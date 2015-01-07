class Tweet < ActiveRecord::Base
  validates :content, presence: true
  validates :content, length: { maximum: 140 }

  belongs_to :author, class_name: "User"
  has_many :likes

  def elapsed_time
    seconds = (Time.now - self.created_at).round(0)
    "#{seconds}s"
    # case
    # when seconds < 60
    #   "#{seconds}s"
    # when seconds > 60
    #   "#{seconds / 60}m"
    # when seconds > 3600
    #   "#{seconds / 3600}h"
    # end
  end
end
