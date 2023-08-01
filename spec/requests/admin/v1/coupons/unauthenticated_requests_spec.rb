require "rails_helper"

RSpec.describe "Admin v1 coupons without authentication", type: :request do
  context "GET /coupons" do
    let(:url) { "/admin/v1/coupons" }
    let!(:coupons) { create_list(:coupon, 5) }

    before(:each) { get url }
  end

  context "POST /coupons" do
    let(:url) { "/admin/v1/coupons" }

    before(:each) { post url }

    include_examples "unauthenticated access"
  end

  context "PATCH /coupons/:id" do
    let(:coupon) { create(:coupon) }
    let(:url) { "/admin/v1/coupons/#{coupon.id}" }

    before(:each) { patch url }

    include_examples "unauthenticated access"
  end
end
