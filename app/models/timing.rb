class Timing < ActiveRecord::Base
  attr_accessible :seconds, :trail_id, :user_id

  validates :user_id, :presence => true
  validates :trail_id, :presence => true
  validates :seconds, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }

  belongs_to :user
  belongs_to :trail
end
