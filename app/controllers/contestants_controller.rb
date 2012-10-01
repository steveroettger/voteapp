class ContestantsController < ApplicationController
  before_filter :authenticate_admin_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    #@contestants = Contestant.find_with_reputation(:votes, :all, order: "votes desc")
    @contestants = Contestant.find(:all, :order => 'id')
    @contestant = Contestant.find(1)
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
    @contestant = Contestant.find(params[:id])
    @contestant.destroy
  end
  
  #method definition for vote feature
  def vote
    vote = current_user.contestant_votes.new(value: params[:value], contestant_id: params[:id])
#    if ((today - last_vote) / 3600) <= 24
#      redirect_to :back, alert: "Unable to vote, only vote per day."
#    else vote.save
#      redirect_to :back, notice: "Success!"
#    end
    
#    if current_user.contestant_votes == nil
      vote.save
      redirect_to :back, notice: "Success!"
#    elsif current_user.contestant_votes != nil && ((Time.now - (current_user.contestant_votes.last.created_at)) / 3600) <= 24
#      redirect_to :back, alert: "Unable to vote, only vote per day."
#    else
#      redirect_to :back, alert: "Unable to vote."
#   end
  end
end
