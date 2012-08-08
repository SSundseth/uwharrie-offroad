class Trail < ActiveRecord::Base
  include Commentable
  attr_accessible :difficulty, :length, :name, :info

  validates :name, :presence => true
  validates :length, :presence => true
  validates :difficulty, :presence => true

  has_many :timings, :dependent => :destroy
  has_many :locations, :dependent => :destroy

  def to_param
    "#{id}-#{name.downcase.gsub(/ /, '-')}"
  end

  def best_timing
    timings.order('seconds ASC').first
  end
  def best_time_user
    best_timing.user
  end
end
