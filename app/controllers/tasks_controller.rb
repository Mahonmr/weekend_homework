class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:new, :create, :index, :edit, :update, :destroy]


  def index
    @tasks = @list.tasks
  end


  def show
  end

  def new
    @task = @list.tasks.new
  end

  def edit
  end

  def create
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to  list_path(@list)
    else
      render :new
    end
  end

  def update
    if @list.tasks.update(@task, task_params)
      redirect_to  list_path(@list)
    else
      render :edit
    end
  end


  def destroy
    if @task.destroy
      redirect_to list_path(@list)
    else
      render edit
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    def task_params
      params.require(:task).permit(:description, :list_id)
    end
end
