class BoardsController < ApplicationController
  before_action :set_board, only: [:edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
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
    #set_board
  end

  def update
    #set_board
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def board_params
    params.require(:board).permit(:title, :description)
  end

  def set_board
    @board = current_user.boards.find(params[:id])
  end

end
