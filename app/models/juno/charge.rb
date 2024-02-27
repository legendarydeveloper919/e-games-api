# frozen_string_literal: true

class Juno::Charge < ApplicationRecord
  belongs_to :order

  validates :key, :code, :status, presence: true
  validates :number, presence: true, uniqueness: { scope: :order_id },
                     numericality: { greater_than: 0, only_integer: true }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
