require 'spec_helper'

describe Timing do

  subject { FactoryGirl.create(:timing) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:trail) }
  it { should validate_presence_of(:seconds) }
  it { should validate_numericality_of(:seconds) }

  describe "hours/minutes/seconds_remaining" do
    it "should sum up to seconds" do
      (subject.hours*3600 + subject.minutes*60 + subject.seconds_remaining).should == subject.seconds
    end
  end
end
