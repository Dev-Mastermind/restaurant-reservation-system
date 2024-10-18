require 'rails_helper'

RSpec.describe Reservation, type: :model do
  # Test associations
  describe 'associations' do
    it { should have_many(:reservation_tables) }
    it { should have_many(:tables).through(:reservation_tables) }
  end

  describe 'validations' do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:reserve_time) }

    it 'validates that reservation time is on the hour' do
      reservation = Reservation.new(name: "Test Reservation", reserve_time: "2024-10-15 07:30:00")
      expect(reservation).not_to be_valid
      expect(reservation.valid?).to be_falsey
      expect(reservation.errors[:reserve_time]).to include("must start on the hour.")

      reservation.reserve_time = "2024-10-15 07:00:00"
      expect(reservation.valid?).to be_truthy
    end
  end
end
