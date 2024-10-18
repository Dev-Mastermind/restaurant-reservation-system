class Reservation < ApplicationRecord
  has_many :reservation_tables
  has_many :tables, through: :reservation_tables

  validates :name, presence: true
  validates :reserve_time, presence: true
  validate :reserve_time_must_be_on_the_hour

  def reserve_time_must_be_on_the_hour
    unless reserve_time.min.zero? && reserve_time.sec.zero?
      errors.add(:reserve_time, "must start on the hour.")
    end
  end
end
