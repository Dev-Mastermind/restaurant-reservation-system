class ReservationsController < ApplicationController

  def welcome; end

  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if reserve_tables(@reservation) && @reservation.save
      flash.now[:notice] = "Reservation created successfully."
      @updated_reservation = Reservation.new
    else
      @updated_reservation = @reservation
      flash.now[:alert] = "We can't reserve due to low capacity."
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :seating_capacity, :reserve_time)
  end

  def reserve_tables(reservation)
    seating_capacity = reservation_params[:seating_capacity].to_i

    available_tables_slot = available_tables_for_reserved_time(reservation.reserve_time)
    selected_tables_slot = select_tables_for_capacity(available_tables_slot, seating_capacity)

    if selected_tables_slot.present?
      reservation.tables << selected_tables_slot
      true
    else
      false
    end
  end

  def available_tables_for_reserved_time(reservation_time)
    reserved_tables = ReservationTable.joins(:reservation)
                                      .where(reservations: { reserve_time: reservation_time })
                                      .pluck(:table_id)

    Table.where.not(id: reserved_tables)
  end

  def select_tables_for_capacity(available_tables, seating_capacity)
    selected_tables = []
    total_capacity = 0

    available_tables.order(capacity: :desc).each do |table|
      selected_tables << table
      total_capacity += table.capacity
      break if total_capacity >= seating_capacity
    end

    total_capacity >= seating_capacity ? selected_tables : nil
  end
end
