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
    if params[:query].present?
      @schedules = Schedule.where('title LIKE ?', "%#{params[:query]}%")
    else
      @schedules = Schedule.all
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    @task = Task.new
    @tasks = @schedule.tasks.includes(:user).order(created_at: :desc)
  end

  def edit
    @schedule = current_user.schedules.find(params[:id])
  end
  
  def update
    @schedule = current_user.schedules.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule), success: t('defaults.flash_message.updated', item: Schedule.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Schedule.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  schedule = current_user.schedules.find(params[:id])
  schedule.destroy!
  redirect_to schedules_path, success: t('defaults.flash_message.deleted', item: Schedule.model_name.human), status: :see_other
end


  private

  def schedule_params
    params.require(:schedule).permit(:title, :body)
  end
end
