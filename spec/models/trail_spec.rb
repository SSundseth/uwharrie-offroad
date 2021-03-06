require 'spec_helper'

describe Trail do
  subject { FactoryGirl.create(:trail) }
  let(:user) { FactoryGirl.create(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:length) }
  it { should validate_presence_of(:difficulty) }

  describe "being deleted" do
    before do
      subject.timings.create(:user_id => user.id, :seconds => 3600)
    end

    it "should delete associated timings" do
      lambda { subject.destroy }.should change(Timing, :count).by(-1)
    end
  end
  describe "#leaderboard" do
    before do
      subject.timings.create(:user_id => user.id, :seconds => 600)
      subject.timings.create(:user_id => user.id, :seconds => 500)
    end

    it "returns timing with lowest seconds" do
      subject.leaderboard.first.seconds.should == 500
    end
  end
end
