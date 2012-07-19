require 'spec_helper'

describe UsersController do
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

  describe "GET #show" do
    before do
      get :show, :id => user.id
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
  end

  describe "GET #edit" do
    before do
      get :edit, :id => user.id
    end

    it { should respond_with(:success) }
    it { should render_template(:edit) }
  end

  describe "PUT #update" do
    describe "with good data" do
      before do
        put :update, :id => user.id, :user => {
          :email => 'newemail@email.com',
          :password => 'newpassword' }
      end

      it { should redirect_to(user) }
      it { should set_the_flash.to("Account Updated") }
    end

    describe "with bad data" do
      before do
        put :update, :id => user.id, :user => {
          :email => user.email,
          :password => 'short' }
      end

      it { should set_the_flash.to("Account not Updated") }
      it { should respond_with(:success) }
      it { should render_template(:edit) }
    end
  end
end
