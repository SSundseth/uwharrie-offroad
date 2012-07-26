require 'spec_helper'

describe "Comments" do
  let(:user)  { FactoryGirl.create(:user) }
  let(:trail) { FactoryGirl.create(:trail) }
  before do
    visit trail_path(trail)
    log_in_helper(user)
  end

  describe "being created" do
    describe "with bad data" do
      it "should not allow the body to be blank" do
        lambda {
          click_button "Post Comment"
        }.should_not change(Comment, :count)

        page.should have_content "Comment cannot be blank"
      end
    end

    describe "with good data" do
      it "should redirect to the trail page" do
        lambda {
          fill_in "comment[body]", :with => "this is comment text"
          click_button "Post Comment"
        }.should change(Comment, :count).by(1)

        page.should have_content "Comment Saved"
        page.should have_content "this is comment text"
        current_path.should == trail_path(trail)
      end
    end
  end

  describe "being deleted" do
    it "should change the body" do
      fill_in "comment[body]", :with => "this is comment text"
      click_button "Post Comment"

      lambda {
        click_link "delete"
      }.should_not change(Comment, :count)

      page.should have_content "Comment has been deleted by user"
    end
  end

  describe "being edited" do
    before do
      fill_in "comment[body]", :with => "this is comment text"
      click_button "Post Comment"
      click_link "edit"
    end

    describe "with bad data" do
      it "should not change the body" do
        click_button "Edit Comment"

        current_path.should == edit_comment_path
        page.should have_content "Edit cannot be blank"

    describe "with good data" do
      it "should change the body" do
        fill_in "body", :with => "this is an edit"
        click_button "Edit Comment"

        page.should have_content "Comment Edited"
        page.should have_content "this is comment text\nEDIT: this is an edit"
        current_path.should == trail_path(trail)
      end
    end
  end
end
