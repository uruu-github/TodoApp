class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @board = Board.find(params[:board_id])
    @tasks = @board.tasks.all
  end

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build
    @task.user = current_user
  end

  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_path(@board), notice: '保存できたよ'
    else
      puts @task.errors.full_messages #エラーメッセージをコンソールに出力
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

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :delivery,
      :eyecatch,
      :user
    )
  end

end
