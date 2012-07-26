require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }

  describe "being created" do
    it "should update the User count" do
      lambda {
        Factory(:user)
      }.should change(User, :count).by(1)
    end
  end

  describe "being deleted" do
    before do
      subject.timings.create(:trail_id => 1, :seconds => 3600)
    end

    it "should delete associated timings" do
      lambda {
        subject.destroy
      }.should change(Timing, :count).by(-1)
    end
  end

  describe "#best_times" do
    before do
      subject.timings.create(:trail_id => 1, :seconds => 3600)
    end

    it "should return timings" do
      subject.best_times.first.trail_id.should == 1
    end
  end
end
