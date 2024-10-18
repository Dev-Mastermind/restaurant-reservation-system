require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:capacity) }
    it { should validate_numericality_of(:capacity).only_integer.is_greater_than(0) }
  end

  describe 'associations' do
    it { should have_many(:reservation_tables) }
    it { should have_many(:reservations).through(:reservation_tables) }
  end
end
