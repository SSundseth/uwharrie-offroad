require 'spec_helper'

describe PasswordResetsController do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET #new" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST #create" do
    describe "with valid email" do
      before do
        post :create, :email => user.email
      end

      it { should set_the_flash.to("Email has been sent with instructions") }
      it { should redirect_to(root_url) }
    end

    describe "with invalid email" do
      before do
        post :create, :email => "lolwut@nope.com"
      end

      it { should set_the_flash.to("Email not found") }
      it { should respond_with(:success) }
      it { should render_template(:new) }
    end
  end
end
