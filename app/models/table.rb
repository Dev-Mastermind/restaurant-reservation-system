class Table < ApplicationRecord
  has_many :reservation_tables
  has_many :reservations, through: :reservation_tables

  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
