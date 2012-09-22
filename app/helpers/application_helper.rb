module ApplicationHelper
  #Fangate image
  def fangate_image
    image_tag('fiat-fangate.jpg', border: 0)
  end
  
  # Main image used in the header
  def header_img
    image_tag('header-img.jpeg', border: 0)
  end
  
  # Icons for contestant profile section
  def facebook_icon
    image_tag('facebook.png', border: 0)
  end
  
  def twitter_icon
    image_tag('twitter.png', border: 0)
  end
  
  def linkedin_icon
    image_tag('linkedin.png', border: 0)
  end
  
  def foursquare_icon
    image_tag('foursquare.png', border: 0)
  end
  
  def instagram_icon
    image_tag('instagram.png', border: 0)
  end

end
