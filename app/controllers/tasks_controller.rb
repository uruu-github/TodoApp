class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_path(@task), notice: '保存できたよ'
    else
      puts @board.errors.full_messages #エラーメッセージをコンソールに出力
      flash.now[:error] = '保存に失敗しました' #失敗時にエラーメッセージを一時表示
      render :new
    end
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
