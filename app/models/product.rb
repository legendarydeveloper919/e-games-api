# frozen_string_literal: true

class Product < ApplicationRecord
  include LikeSearchable
  include Paginatable

  belongs_to :productable, polymorphic: true
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_one_attached :image

  validates :description, :image, :image, :status, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :featured, presence: true, if: -> { featured.nil? }

  enum status: { available: 1, unavailable: 0 }
end
