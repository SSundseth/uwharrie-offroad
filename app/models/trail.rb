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

  def leaderboard
    timings.order('seconds ASC').limit(5)
  end
end
