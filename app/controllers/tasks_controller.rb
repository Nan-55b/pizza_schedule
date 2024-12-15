class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    task = current_user.tasks.build(task_params)
    if task.save
      redirect_to schedule_path(task.schedule), success: t('defaults.flash_message.created', item: Task.model_name.human)
    else
      redirect_to schedule_path(task.schedule), danger: t('defaults.flash_message.not_created', item: Task.model_name.human)
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def task_params
    params.require(:task).permit(:body).merge(schedule_id: params[:schedule_id])
  end
end
