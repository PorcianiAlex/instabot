require 'unsplash'
require 'open-uri'
require 'pp'

Unsplash.configure do |config|
  config.application_access_key = "71fb319e8f8f2a5efb1598b623ae44cb7bdd094769e8fd309064d5bd62209f1f"
  config.application_secret = "624603f738bf43f28fc7e6314e15ddddeecc130dec56c2626c971826820296c5"
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "alices_terrific_client_app"
end



photo = Unsplash::Photo.find("tAKXap853rY")

search_results = Unsplash::Photo.search("food")

search_results.each do |photo|
  
  filename = photo.description + ", by " + photo.user.name

  5.times do |i|
    filename += ' #' + photo.photo_tags[i]["title"]
  end

  # open( filename + '.jpg', 'wb') do |file|
  #   file << open('photo.links.download').read 
  # end

  download = open(photo.urls.full + "&w=640&h=640&fit=crop")
  IO.copy_stream(download, filename + '.jpg')

end



