class TasksController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :delivery,
      :eyecatch
    )
  end

end
