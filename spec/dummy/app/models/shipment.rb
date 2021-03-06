class Shipment < ActiveRecord::Base
  include Herstory
  has_many :arrival_loads
  has_many :arrivals, through: :arrival_loads, dependent: :destroy
  has_and_belongs_to_many :packs

  validates :pieces, numericality: {greater_than: 1}, allow_nil: true
end
