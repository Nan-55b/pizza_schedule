class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    task = current_user.tasks.build(task_params)
    if task.save
      redirect_to schedule_path(task.schedule), success: t('defaults.flash_message.created', item: Task.model_name.human)
    else
      redirect_to schedule_path(task.schedule), danger: t('defaults.flash_message.not_created', item: Task.model_name.human)
    end
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to schedule_path(@task.schedule), success: t('defaults.flash_message.updated', item: Task.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to schedule_path(@task.schedule), success: t('tasks.destroy')
  end


  def toggle_complete
    @task = Task.find(params[:id])
    if @task.status == "completed"
      @task.update(status: "pending")
    else
      @task.update(status: "completed")
    end
    respond_to do |format|
      format.html { redirect_to schedule_path(@task.schedule) } # HTMLリクエストの場合はリダイレクト
      format.js   # JSリクエストの場合は、別途 `toggle_complete.js.erb` を呼び出す
    end
  end

  private

  def task_params
    params.require(:task).permit(:body, :start_time, :end_time, :completed).merge(schedule_id: params[:schedule_id])
  end
end
