class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def show
    #set_article
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board),notice: '保存できたよ' #保存成功時に詳細ページへ
    else
      puts @board.errors.full_messages #エラーメッセージをコンソールに出力
      flash.now[:error] = '保存に失敗しました' #失敗時にエラーメッセージを一時表示
      render :new #フォームを再表示(入力データは保持)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def board_params
    params.require(:board).permit(:title, :description)
  end

  def set_board
    @board = Board.find(params[:id])
  end

end
