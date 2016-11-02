class Airbminusb < Sinatra::Base

  post 'requests/new' do
    params[:user_id] = session[:user_id]
    @booking = Booking.create(params)
    redirect to '/requests'
    flash.now[:notices] ||= []
    flash.now[:notices] << "You have requested to stay at #{@booking.place.name} on #{@booking.date}"
    redirect to 'requests'
  end

  get '/requests' do
    @requests_made = Booking.requests_made(session[:user_id])
    @requests_received = Booking.requests_received(session[:user_id])
    erb :'requests/index'
  end

  post '/requests/confirm' do
    @confirmed_booking = Booking.get(params[:id])
    @confirmed_booking.update(confirmed: true)
    flash.now[:notices] = ["Booking Confirmed!"]
    redirect to '/requests'
  end

end
