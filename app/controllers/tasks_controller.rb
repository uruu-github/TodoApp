class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_board, only: [:index, :new, :create, :destroy, :show]
  before_action :set_task, only: [:show, :destroy]
  before_action :set_edit_task, only: [:edit, :update]

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
      Rails.logger.error(@task.errors.full_messages)
      flash.now[:error] = '保存に失敗しました' #失敗時にエラーメッセージを一時表示
      render :new
    end
  end

  def show
    @comments = @task.comments
  end

  def edit
  end

  def update
    puts "Updating task with params: #{task_params.inspect}"
    if @task.update(task_params)
      redirect_to board_task_path(@board, @task), notice: 'タスクを更新しました'
    else
      puts @task.errors.full_messages # エラーメッセージを出力
      flash.now[:error] = 'タスクの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @task.destroy!
    redirect_to board_path(@board), notice: '削除に成功しました'
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :delivery,
      :eyecatch,
      :board_id
    )
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    begin
      @task = @board.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "指定されたタスクが見つかりませんでした"
      redirect_to board_path(@board)
    end
  end


  def set_edit_task
    @board = current_user.boards.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
  end

end
