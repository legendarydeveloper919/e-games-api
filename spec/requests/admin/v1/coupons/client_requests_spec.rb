require "rails_helper"

RSpec.describe "Admin v1 coupons as :client", type: :request do
  let(:user) { create(:user, profile: :client) }

  context "GET /coupons" do
    let(:url) { "/admin/v1/coupons" }
    let!(:coupons) { create_list(:coupon, 5) }

    before(:each) { get url, headers: auth_header(user) }

    include_examples "forbidden access"
  end
end
