class IdeasController < ApplicationController
  def new
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.save
    redirect_to @idea
  end

  private
    def idea_params
      params.require( :idea).permit( :title, :text)
    end
end
