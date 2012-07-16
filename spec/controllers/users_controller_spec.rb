require 'spec_helper'

describe UsersController do
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
        post :create, :user => {
          :name => 'newuser',
          :email => 'newuser@email.com',
          :password => 'password' }
      end

      it { should redirect_to(root_url) }
      it { should set_the_flash.to('You have successfully registered') }
    end

    describe "with bad data" do
      before do
        post :create, :user => {
          :name => 'newuser',
          :email => 'newuser@email.com',
          :password => 'short' }
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }
    end
  end
end
