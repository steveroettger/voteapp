class ContestantsController < ApplicationController
  
  def index
    #@contestants = Contestant.find_with_reputation(:votes, :all, order: "votes desc")
    @contestants = Contestant.all
    #@contestant = Contestant.find(params[:id])
  end
  
  def new
    @contestant = Contestant.new
  end
  
  def create
    @contestant = Contestant.new(params[:contestant])
    if @contestant.save
      redirect_to @contestant, notice: 'New contestant profile has been created.'
    else
      render 'new'
    end
  end
  
  def show 
    @contestant = Contestant.find(params[:id])
  end
  
  def edit
    @contestant = Contestant.find(params[:id])
  end
  
  def update
    @contestant = Contestant.find(params[:id])
    if @contestant.update_attributes(params[:contestant])
      redirect_to @contestant, notice: 'Contestant profile has been updated.'
    else
      render 'edit'
    end
  end
  
  def destroy 
  end
  
  #method definition for vote feature
  def vote
    value = params[:type] == "up" ? 1 : 0
    @contestant = Contestant.find(params[:id])
    @contestant.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end
  
end
