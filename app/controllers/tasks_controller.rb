class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    # no need for app/views/taskss/create.html.erb
    redirect_to tasks_path(@tasks)
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end

def delete
  @task = Task.find(params[:id])
  @task.destroy
end

  private

  def tasks_params
    params.require(:task).permit(:title, :details)
  end

end
