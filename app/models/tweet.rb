class Tweet < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  def elapsed_time
    seconds = (Time.now - self.created_at).round(0)
    case
    when seconds < 60
      "#{seconds}s"
    when seconds > 60
      "#{seconds / 60}m"
    when seconds > 3600
      "#{seconds / 3600}h"
    end
  end
end
