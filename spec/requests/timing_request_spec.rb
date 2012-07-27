require 'spec_helper'

describe "Timing" do
  let(:user) { FactoryGirl.create(:user) }
  context "being submitted by a user" do
    before do
      FactoryGirl.create(:trail)
      visit root_url
      log_in_helper(user)
      visit new_timing_path
    end

    it "does not allow invalid input" do
      select 'TestTrail', :from => "Trail"
      fill_in "Hours", :with => "-1"
      click_button "Submit"

      current_path.should == "/timings"
    end

    it "allows a user to enter a new time" do
      select 'TestTrail', :from => "Trail"
      fill_in "Hours", :with => "1"
      click_button "Submit"

      current_path.should == user_path(user)
      page.should have_content "#{'TestTrail'}: 01:00:00"
    end

    it "displays a message if that time is the best" do
      select 'TestTrail', :from => "Trail"
      fill_in "Seconds", :with => "1"
      click_button "Submit"

      page.should have_content "#{'TestTrail'}: 00:00:01 Best Overall!"
    end
  end
end
