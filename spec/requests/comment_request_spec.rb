require 'spec_helper'

describe "Comments" do
  let(:user)  { FactoryGirl.create(:user) }
  let(:trail) { FactoryGirl.create(:trail) }
  before do
  describe "being created" do
    describe "with bad data" do
      it "should not allow the body to be blank" do
      end
    end

    describe "with good data" do
      it "should redirect to the trail page" do
      end

      it "should display on the trail page" do
      end
    end
  end

  describe "being deleted" do
    it "should change the body" do
    end
  end

  describe "being edited" do
    it "should change the body" do
    end
  end
end
