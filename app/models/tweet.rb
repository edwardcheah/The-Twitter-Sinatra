class Tweet < ActiveRecord::Base
  validates :content, presence: true
  validates :content, length: { maximum: 140 }

  belongs_to :author, class_name: "User"
  has_many :likes

  def elapsed_seconds
    seconds = (Time.now - self.created_at).round(0)
  end

  def display_elapsed_time
    seconds = self.elapsed_seconds
    time_displayed = 0
    case
    when seconds < 60
      time_displayed = "#{seconds}s"
    when seconds > 3600
      time_displayed = "#{seconds / 3600}h"
    when seconds > 60
      time_displayed = "#{seconds / 60}m"
    end
    time_displayed
  end
end
