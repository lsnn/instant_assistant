class Task < ActiveRecord::Base

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(task_params)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path
    else
      redirect_to new_task_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

end
