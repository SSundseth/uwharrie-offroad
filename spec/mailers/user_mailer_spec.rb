require "spec_helper"

describe UserMailer do
  describe "password_reset" do
    subject { FactoryGirl.create(:user, email: "to@example.org") }
    let(:mail) { UserMailer.password_reset(subject) }

    it "renders the headers" do
      mail.subject.should eq("Password Reset")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["uwharrieoffroad@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Your password has been reset, please login with the following:")
    end
  end

end
