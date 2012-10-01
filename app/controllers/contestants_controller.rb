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
    vote = User.find(current_user).contestant_votes.new(value: params[:value], contestant_id: params[:id])    
  
    if User.find(current_user).contestant_votes.any? == true
      time = Time.now
      last_vote = User.find(current_user).contestant_votes.last.created_at
      time_span = (time - last_vote) / 3600
      if time_span <= 24
        redirect_to :back, alert: "Unable to vote, only one vote per day."
      else
        vote.save
        redirect_to :back, notice: "Success!"
      end
    else
      vote.save
      redirect_to :back, notice: "Success!"
    end
  end
end
