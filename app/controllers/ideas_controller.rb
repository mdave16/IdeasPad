class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to @idea
    else
      render 'new'
    end
  end

  private
    def idea_params
      params.require( :idea).permit( :title, :text)
    end
end
