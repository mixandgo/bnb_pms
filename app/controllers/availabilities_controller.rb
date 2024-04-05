class AvailabilitiesController < ApplicationController
  def index
    @days = Date.current.end_of_month.day
    @date_start = Date.current.beginning_of_month
    @date_end = Date.current.end_of_month
    @availabilities = Availability
      .joins(room: :property)
      .where(date: @date_start..@date_end, properties: { id: 1 })
      .pluck(:date, :rate)
      .map! { |date, rate| [date.to_s, rate] }
  end
end
