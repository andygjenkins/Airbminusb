class Airbminusb < Sinatra::Base

  get '/places/new' do
    erb :'places/new'
  end

  post '/places/new' do
    @place = Place.create(params)
  end

end
