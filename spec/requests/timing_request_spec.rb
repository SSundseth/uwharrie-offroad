require 'spec_helper'

describe "Timing" do
  let(:user) { FactoryGirl.create(:user) }
  let(:trail) { FactoryGirl.create(:trail) }
  context "inputting a time" do
    before do
      log_in_helper(user)
      visit new_timing_path
    end

    it "does not allow invalid input" do
      select trail.name, :from => "Trail"
      fill_in "Hours", :with => "-1"
      click_button "Submit"

      current_path.should == new_timing_path
    end

    it "allows a user to enter a new time" do
      select trail.name, :from => "Trail"
      fill_in "Hours", :with => "1"
      click_button "Submit"

      current_path.should == user_path(user)
      page.should have_content "#{trail.name}: 01:00:00"
    end

    it "displays a message if that time is the best" do
      select trail.name, :from => "Trail"
      fill_in "Seconds", :with => "1"
      click_button "Submit"

      page.should have_content "#{trail.name}: 00:00:01 Best Overall!"
    end
  end
end
