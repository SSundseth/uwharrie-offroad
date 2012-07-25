require 'spec_helper'

describe SessionsController do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET #new" do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  describe "POST #create" do
    describe "with good data" do
      before do
        post :create, :name => user.name, :password => user.password
      end

      it { should redirect_to(root_url) }
    end

    describe "with bad data" do
      before do
        post :create, :name => user.name, :password => 'short'
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }
    end
  end

  describe "DELETE #destroy" do
    before do
      log_in(user)
      delete :destroy
    end

    it { should respond_with(:redirect) }
    it { should redirect_to(root_url) }

    it 'should remove user from session' do
      session[:user_id].should be_nil
    end
  end
end
