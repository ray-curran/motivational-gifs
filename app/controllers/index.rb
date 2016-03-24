SHIA_URLS = ["https://media4.giphy.com/media/2rqHW2AQ8rMBy/200.gif", "https://media3.giphy.com/media/MXSygxIZiC50s/200.gif", "https://media4.giphy.com/media/11QgR6K4rx2cSs/200_s.gif", "https://media4.giphy.com/media/hCNKIL3NQRzIk/200_s.gif", "https://media4.giphy.com/media/Zf5WN7FbszXW/200.gif", "https://media0.giphy.com/media/h65eL3fNq4m4g/200.gif", "https://media3.giphy.com/media/mNhXW7G4YdU9q/200.gif", "https://media0.giphy.com/media/QVX080oh1H6X6/200.gif", "https://media2.giphy.com/media/qMpMol5suSihG/200.gif"]
REAL_URLS = ["https://media.giphy.com/media/Zt36ALx4PwFEY/giphy.gif", "https://media0.giphy.com/media/cK6whOWozS87K/200.gif", "https://media.giphy.com/media/LPHpbJJdK7Xq/giphy.gif", "https://media.giphy.com/media/wGyDfjAzGDBok/giphy.gif", "https://media4.giphy.com/media/dKc7Asfz1DHJS/200.gif", "http://www.allgifs.com/wp-content/uploads/2013/08/willing.gif", "http://www.allgifs.com/wp-content/uploads/2013/08/do-it.gif", "http://www.allgifs.com/wp-content/uploads/2013/08/motivation1.gif", "http://www.allgifs.com/wp-content/uploads/2013/08/follow-your-dreams.gif"]


get '/' do
  redirect '/inspirations'
end

get '/inspirations' do
  if request.xhr?
    session[:gifs] += 1
    if session[:gifs] > 2
      url = SHIA_URLS.sample
      content_type :json
      {url: url, phase: 1}.to_json
    else
      url = REAL_URLS.sample
      content_type :json
      {url: url, phase: 0}.to_json
    end
  else
    session[:gifs] = 0
    @url = REAL_URLS.sample
    erb :inspirations
  end
end

# get '/inspirations/generate' do
#   redirect '/inspirations'
# end
