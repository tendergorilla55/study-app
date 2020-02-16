require 'rails_helper'

describe WeightRecordsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  before do
    login_user user
  end

  describe 'get #index' do
    it "returns https success" do
      get :index
      expect(response).to have_http_status :success
    end
  end

  describe 'post #create' do
    let(:params) { FactoryBot.attributes_for(:weight_record) }

    it "returns https success" do
      post :create, params: { record: params }
      expect(response).to have_http_status :success
      expect(WeightRecord.all.size).to eq 1
    end
  end
end
