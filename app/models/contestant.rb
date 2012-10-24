class Contestant < ActiveRecord::Base
  attr_accessible :name, :image_url, :age, :vocation, :bio, :fb_link, :twitter_link, :youtube_link, :profile_img, :test_drive_votes
  
  has_many :contestant_votes
  
  def votes
    read_attribute(:votes) || contestant_votes.sum(:value)
  end
  
  def test_drive_vote_count
    read_attribute(:test_drive_votes)
  end
  
  def total_votes
    if test_drive_vote_count == nil
      contestant_votes.sum(:value)
    else
      contestant_votes.sum(:value) + test_drive_vote_count
    end
  end
    
  def car_position
    #total track = 480px
    #to make car start at beginning of track :: 480px - 43px (car height) = 437 px
    #if (437 - contestant_votes.sum(:value)) <= 50
    #  car_position = 50
    #else
    #  car_position = 437 - contestant_votes.sum(:value)
    #end
    case total_votes
      when total_votes > 2500
        car_position = 100
      when total_votes = 2000 .. 2499
        car_position = 100
      when total_votes = 1500 .. 1999
        car_position = 150
      when total_votes = 1000 .. 1499
        car_position = 200
      when total_votes = 500 .. 999
        car_position = 250  
      when total_votes = 250 .. 499
        car_position = 300
      when total_votes = 100 .. 249
        car_position = 350
      when total_votes = 50 .. 99
        car_position = 375
      when total_votes = 1 .. 49
        car_position = 400
      else
        car_position = 437
    end
  end
    
    
    #updated_vote = (contestant_votes.sum(:value) * 0.80) * 0.35
    
    #if (contestant_votes.sum(:value) * 0.80) >= 100
      #if 437 - updated_vote <= 50
        #car_position = 50
      #else
        #car_position = 437 - updated_vote
      #end
    #else
      #car_position = (437 - (contestant_votes.sum(:value) * 0.80))
    #end
  #end  
end
