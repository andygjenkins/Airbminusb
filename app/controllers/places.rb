class Airbminusb < Sinatra::Base

  get '/places/new' do
    erb :'places/new'
  end

  post '/places/new' do
    params[:user_id] = 1#session[:user_id]
    @place = Place.create(params)
    redirect '/places/listings'
    flash[:notice] << "#{@place.name} has been added."
  end

  get '/places/listings' do
    @places = Place.all
    erb :'places/listings'
  end

  post '/places/listings' do
    @places = Place.all(:within_available_range? => (params[:start_availability]))
    erb :'places/listings'
  end
end
