class Timing < ActiveRecord::Base
  attr_accessible :seconds, :trail_id, :user_id

  validates :user_id, :presence => true
  validates :trail_id, :presence => true
  validates :seconds, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }

  belongs_to :user
  belongs_to :trail

  def hours
    self.seconds / 3600
  end

  def minutes
    (self.seconds - self.hours * 3600) / 60
  end

  def seconds_remaining
    self.seconds - (self.hours * 3600 + self.minutes * 60)
  end
end
