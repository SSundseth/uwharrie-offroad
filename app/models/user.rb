class User < ActiveRecord::Base
  include SimplestAuth::Model

  authenticate_by :name

  attr_accessible :name, :email, :password

  validates :name, :presence => true
  validates_uniqueness_of :name
  validates_uniqueness_of :email
  validates :password, :presence => true
  validates_confirmation_of :password, :if => :password_required?
end
