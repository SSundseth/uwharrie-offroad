require 'spec_helper'

describe TrailsController do
  let(:trail) { FactoryGirl.create(:trail) }

  describe "GET #index" do
    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
  end

  describe "GET #show" do
    before do
      get :show, :id => trail.id
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
  end
end
