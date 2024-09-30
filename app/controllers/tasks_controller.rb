class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def new
    @task = current_user.tasks.build
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
