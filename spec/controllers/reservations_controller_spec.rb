require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  let!(:table_2) { create(:table, capacity: 2) }
  let!(:table_4) { create(:table, capacity: 4) }
  let!(:table_8) { create(:table, capacity: 8) }

  let(:valid_attributes) do
    {
      name: "Test Reservation",
      reserve_time: "2024-10-15 07:00:00",
      requested_capacity: 4
    }
  end

  let(:valid_attributes_2) do
    {
      name: "Test Reservation",
      reserve_time: "2024-10-15 07:00:00",
      requested_capacity: 10
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      reserve_time: ""
    }
  end

  describe "GET #index" do
    before do
      create(:reservation, reserve_time: '2024-10-15 07:00:00')
    end

    it "returns a success response" do
      get :index
      expect(Reservation.count).to eq(1)
      expect(assigns(:reservations).count).to eq(1)
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new reservation when tables are available" do
        expect {
          post :create, params: { reservation: valid_attributes }
        }.to change(Reservation, :count).by(1)

        expect(flash[:notice]).to eq("Reservation created successfully.")
      end
    end

    context "with invalid params" do
      it "does not create a reservation with invalid attributes" do
        expect {
          post :create, params: { reservation: invalid_attributes }
        }.to_not change(Reservation, :count)
      end
    end

    context "when there is insufficient seating capacity" do
      it "does not create a reservation and shows an error" do
        post :create, params: { reservation: valid_attributes_2 }

        # Now try to create another reservation for the same time with insufficient capacity
        expect {
          post :create, params: { reservation: valid_attributes_2 }
        }.to_not change(Reservation, :count)

        expect(Reservation.count).to eq(1)
        expect(flash[:alert]).to eq("We can't reserve due to low capacity.")
      end
    end
  end
end
