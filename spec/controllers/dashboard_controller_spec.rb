require 'spec_helper'

describe DashboardController do
  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe 'GET "index"' do
    it 'должен выполняться успешно' do
      get :index
      response.should be_success
    end

    it 'должен выводить правильное представление' do
      get :index
      response.should render_template(:index)
    end
  end
end