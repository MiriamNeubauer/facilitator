class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @pin = Pin.find(params[:pin_id])
    @comments = Comment.all
    respond_with(@comments)
  end

  def new
    @pin = Pin.find(params[:pin_id])
    @comment = Comment.new
    # respond_with(@pin)
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(comment_params)
    @comment.pin_id = @pin.id
    @comment.user_id = current_user.id 
    if @comment.save
      flash[:success] = "Your comment was created successfully."
      redirect_to pin_path(@pin)
    else
      flash[:eror] = "Your comment did not get saved."
      redirect_to pin_path(@pin)
    end
  end

  def show
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
  end

  def edit
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @pin, notice: 'Your Comment was succesfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    @comment.delete
    redirect_to @pin
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
