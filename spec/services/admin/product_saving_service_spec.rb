require "rails_helper"

RSpec.describe Admin::ProductSavingService, type: :model do
  context "when #call" do
    context "sending loaded produt" do
      let!(:new_categories) { create_list(:category, 2) }
      let!(:old_categories) { create_list(:category, 2) }
      let!(:product) { create(:product, categories: old_categories) }

      context "with valid params" do
        let!(:game) { product.productable }
        let(:params) {
          { name: "New product", category_ids: new_categories.map(&:id),
            productable_attributes: { developer: "New company" } }
        }

        it "update product" do
          service = described_class.new(params, product)
          service.call
          product.reload
          expect(product.name).to eq "New product"
        end
      end
    end
  end
end
