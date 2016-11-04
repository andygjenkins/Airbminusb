class Airbminusb < Sinatra::Base

  get '/places/new' do
    @place = Place.new
    erb :'places/new'
  end

  get '/places/edit/:place_id' do
    @place = Place.get(params[:place_id])
    if @place && @place.user == current_user
      erb :'places/new'
    else
      redirect to '/places/listings'
    end
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
    @places = Place.all(:start_availability.lte => params[:start_availability], :end_availability.gte => params[:start_availability])
    erb :'places/listings'
  end

  get '/places/:id' do
    session[:place_id] = params[:id]
    @place = Place.first(id: params[:id])
    p session
    erb :'places/one_place'
  end

  get '/check_booked' do
    @place = Place.first(id: session[:place_id])
    start_availability = @place.start_or_today.to_s
    end_availability = @place.end_availability.to_s
    booked_dates = Place.booked_dates(session[:place_id])
    {startAvailability: start_availability,
    endAvailability: end_availability,
    bookedDates: booked_dates}.to_json
  end
end
