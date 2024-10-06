class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_board, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  before_action :set_task, only: [:edit, :update, :show, :destroy]

  def index
    @tasks = @board.tasks.all
  end

  def new
    @task = @board.tasks.build
    @task.user = current_user
  end

  def create
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

  private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :delivery,
      :eyecatch,
      :user
    )
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  # def set_task
  #   @task = @board.tasks.find(params[:id])
  # end

  def set_task
    @task = @board.tasks.find_by(id: params[:id])
    if @task.nil?
      flash[:error] = "指定されたタスクが見つかりませんでした"
      redirect_to board_path(@board)
    end
  end

end
