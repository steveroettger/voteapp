module ApplicationHelper
  #Fangate image
  def fangate_image
    image_tag('fiat_fangate.jpg', border: 0)
  end
  
  # Main image used in the header
  def header_img
    image_tag('header-img-2.jpg', border: 0)
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
  
  def vote_text
    image_tag('vote-text.png', border: 0)
  end
  
  def user_likes_page?
    fb_request = parse_signed_request
    return fb_request['page']['liked'] if fb_request && fb_request['page']
  end

  # based on http://www.chilipepperdesign.com/2011/02/15/reveal-fan-gate-like-gate-facebook-iframe-tab-tutorial-with-php
  def parse_signed_request
    if params[:signed_request].present?
      sig, payload = params[:signed_request].split('.')
      # add back the padding stripped off by FB base64url encoding
      payload += '=' * (4 - payload.length.modulo(4))
      # translate base64url chars to base64 characters
      payload = payload.tr('-_','+/')
      # retrieve the payload JSON string
      data = Base64.decode64( payload )
      # quick and dirty, so skip signature verification and just return the data as a hash
      JSON.parse( data )
    end
  rescue Exception => e
    Rails.logger.warn "!!! Error parsing signed_request"
    Rails.logger.warn e.message
  end
end
