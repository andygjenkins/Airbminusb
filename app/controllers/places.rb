class Airbminusb < Sinatra::Base

  get '/places/new' do
    erb :'places/new'
  end

  post '/places/new' do
    params[:user_id] = session[:user_id]
    @place = Place.create(params)
    flash.now[:notices] ||= []
    flash.now[:notices] << "#{@place.name} has been added."
    redirect to '/places/listings'
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
