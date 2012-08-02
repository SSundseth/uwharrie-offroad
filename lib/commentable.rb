module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, :as => :commentable, :dependent => :destroy
  end

  def comment_count
    count = comments.count
    comments.each do |c|
      count += c.comment_count
    end
    count
  end
end
