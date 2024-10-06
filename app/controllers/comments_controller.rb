class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comments

  def new
    @comment = @task.comments.build
  end

  def create
    @comment = @task.comments.build(comment_params)

    if @comment.save
      redirect_to board_task_path(@board, @task), notice: 'Commentを追加'
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end

  def set_comments
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:task_id])
  end

end
