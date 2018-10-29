class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    @idea = Idea.find params[:id]
  end

  def destroy
    idea = Idea.find params[:id]
    idea.destroy
    redirect_to ideas_path
  end

  def index
    @ideas = Idea.all.order(created_at: :desc)
  end

  def edit
    @idea = Idea.find params[:id]
  end

  def update
    @idea = Idea.find params[:id]
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
    

end
