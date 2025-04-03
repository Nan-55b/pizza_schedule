require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  let(:user) { create(:user) }
  let(:schedule) { create(:schedule, user: user) }
  let(:valid_params) { { schedule: { title: 'テストスケジュール', body: 'テスト本文', user_id: user.id } } } # user_idを追加

  describe "GET /schedules/:id returns a successful response" do
    it "returns a successful response" do
      post login_path, params: { email: user.email, password: "password" }
      follow_redirect!

      get schedule_path(schedule)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /schedules creates a new schedule" do
    it "creates a new schedule" do
      post login_path, params: { email: user.email, password: "password" }
      follow_redirect!

      expect {
        post schedules_path, params: valid_params
      }.to change(Schedule, :count).by(1)
    end

    it "redirects to the created schedule" do
      post login_path, params: { email: user.email, password: "password" }
      follow_redirect!

      post schedules_path, params: valid_params
      expect(response).to redirect_to(schedule_path(Schedule.last))
    end
  end
end