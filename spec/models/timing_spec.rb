require 'spec_helper'

describe Timing do

  subject { FactoryGirl.create(:timing) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:trail_id) }
  it { should validate_presence_of(:seconds) }
  it { should validate_numericality_of(:seconds) }

  describe "hours/minutes/seconds_remaining" do
    it "should sum up to seconds" do
      (subject.hours + subject.minutes + subject.seconds_remaining).should == subject.seconds
    end
  end
end
