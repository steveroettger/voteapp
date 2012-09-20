class GiveawayEntriesController < ApplicationController
  
  
  def index
    @giveaway_entry = GiveawayEntry.all
  end
  
  def new
    @giveaway_entry = GiveawayEntry.new
  end
  
  def create
    @giveaway_entry = GiveawayEntry.new(params[:giveaway_entry])
    if @giveaway_entry.save
      redirect_to new_giveaway_entry_path, notice: 'Success.'
    else
      render 'new'
    end
  end
  
  def show 
    @giveaway_entry = GiveawayEntry.find(params[:id])
  end
end