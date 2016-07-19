module FlickrHelper
  def user_photos(user_id, photo_count)
    photos = flickr.photos.search(:user_id => user_id, :per_page => photo_count)     
    return photos      
  end
  
  def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
    begin
      photos = user_photos(user_id, photo_count)
      photos = photos.to_a.in_groups_of columns      
      render :partial => '/flickr/sidebar_widget', :locals => { :photos => photos }      
    rescue Exception
      render :partial => '/flickr/unavailable'      
    end
  end
  
  def get_photo_url(photo)
    info = flickr.photos.getInfo(:photo_id => photo.id, :secret => photo.secret)
    return { :thumb => FlickRaw.url_t(info), :original => FlickRaw.url_o(info) }    
  end
  
  def initFlickraw
    FlickRaw.api_key = ENV['key']
    FlickRaw.shared_secret = ENV['secret']
  end
  
end