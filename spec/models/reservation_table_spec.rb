require 'rails_helper'

RSpec.describe ReservationTable, type: :model do

  describe 'associations' do
    it { should belong_to(:reservation) }
    it { should belong_to(:table) }
  end
end
