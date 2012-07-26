class Trail < ActiveRecord::Base
  include Commentable
  attr_accessible :difficulty, :length, :name

  validates :name, :presence => true
  validates :length, :presence => true
  validates :difficulty, :presence => true

  has_many :timings, :dependent => :destroy

  def best_timing
    timings.order('seconds ASC').first
  end
  def best_time_user
    best_timing.user
  end
end
