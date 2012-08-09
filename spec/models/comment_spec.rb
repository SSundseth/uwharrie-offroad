require 'spec_helper'

describe Comment do
  let(:user)  { FactoryGirl.create(:user) }
  let(:trail) { FactoryGirl.create(:trail) }

  it { should validate_presence_of(:commentable) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:body) }

  describe "being created" do
    it "should update the Comment count" do
      lambda {
        FactoryGirl.create(:comment, :commentable => trail, :user_id => user.id)
      }.should change(Comment, :count).by(1)
    end

    it "should update the trail's comment count" do
      c1 = FactoryGirl.create(:comment, :commentable => trail, :user_id => user.id)
      lambda {
        FactoryGirl.create(:comment, :commentable => c1, :user_id => user.id)
      }.should change { trail.comment_count }.by(1)
    end

    it "should update the user's comment count" do
      lambda {
        FactoryGirl.create(:comment, :commentable => trail, :user => user)
      }.should change(user.comments, :count).by(1)
    end
  end
end
