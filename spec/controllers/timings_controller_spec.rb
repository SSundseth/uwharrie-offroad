require 'spec_helper'

describe TimingsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:trail) { FactoryGirl.create(:trail) }

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
        post :create, :timing => {
          :user_id => "#{user.id}",
          :trail_id => "#{trail.id}",
          :seconds => 3600 }
      end

      it { should redirect_to(root_url) }
      it { should set_the_flash.to('Your time has been saved') }
    end

    describe "with bad data" do
      before do
        post :create, :timing => { }
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should set_the_flash.to('Time not saved') }
    end
  end
end
