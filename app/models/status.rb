class Status < ApplicationRecord

  belongs_to :user

  def self.total_point(status)
    total = status.sleep + status.study + status.exercise + status.diet + status.habit + status.aim + status.login
    return total
  end

end
