class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def index
    @schedules = Schedule.includes(:user)
  end
end
