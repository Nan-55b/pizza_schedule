class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      redirect_to schedules_path, success: t('defaults.flash_message.created', item: Schedule.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Schedule.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @schedules = Schedule.includes(:user)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :body)
  end
end
