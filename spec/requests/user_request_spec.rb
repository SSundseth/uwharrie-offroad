require "spec_helper"

describe "User" do

  let(:user) { FactoryGirl.create(:user, :name => 'TestName', :password => 'password') }

  context "signing up" do
    before do
      visit "/signup"
    end

    it "does not allow invalid info" do
      fill_in "user_name", :with => "TestSignUp"
      fill_in "user_password", :with => "short"
      click_button "Sign Up"

      page.should have_content "is too short (minimum is 6 characters)"
    end

    it "allows signup with proper info" do
      fill_in "user_name", :with => "TestSignUp"
      fill_in "user_password", :with => "password"

      expect { click_button "Sign Up" }.to change { User.count }.by(1)

      current_path.should == root_path
      page.should have_content "You have successfully registered"
    end
  end

  context "logging in and out" do
    before do
      FactoryGirl.create(:user)
      visit "/login"
    end

    it "is not validated with improper info" do
      fill_in "name", :with => user.name
      fill_in "password", :with => "badpass"
      click_button "Sign In"

      page.should have_content "Invalid username or password"
    end

    it "is logged in with proper info" do
      log_in_helper(user)

      current_path.should == root_path
      page.should have_content "TestName"

      click_link "Logout"
      current_path.should == root_path
      find_link("Login").should be_visible
    end
  end

  context "editing account" do
    before do
      log_in_helper(user)
      visit edit_user_path(user)
    end

    it "cannot input bad info" do
      fill_in "user_email", :with => "email@tests.com"
      fill_in "user_password", :with => "short"
      click_button "Edit"

      page.should have_content "is too short (minimum is 6 characters)"
      current_path.should == user_path(user)
    end

    it "can change with good info" do
      fill_in "user_email", :with => "email@tests.com"
      fill_in "user_password", :with => "newpassword"
      click_button "Edit"

      page.should have_content "Account Updated"
      current_path.should == user_path(user)
    end
  end

  context "deleting account" do
    before do
      log_in_helper(user)
      visit edit_user_path(user)
    end

    it "removes user from the database" do
      expect { click_link "Delete Account" }.to change { User.count }.by(-1)
    end
  end
end
