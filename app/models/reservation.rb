class Reservation < ApplicationRecord
  has_many :reservation_tables
  has_many :tables, through: :reservation_tables

  validates :name, :reserve_time, presence: true
  validate :reserve_time_must_be_on_the_hour, if: :reserve_time_present?

  def reserve_time_must_be_on_the_hour
    unless reserve_time.min.zero? && reserve_time.sec.zero?
      errors.add(:reserve_time, "must start on the hour.")
    end
  end

  def reserve_time_present?
    reserve_time.present?
  end
end
