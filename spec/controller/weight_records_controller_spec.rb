require 'rails_helper'

describe WeightRecordsController, type: :controller do
  describe "get #index" do

    let(:user) { FactoryBot.build(:user) }

    before do
      login_user user
    end

    it "returns https success" do
      expect(response).to have_http_status :success
    end
  end
end
