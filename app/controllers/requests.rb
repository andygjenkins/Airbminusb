class Airbminusb < Sinatra::Base

  post '/requests/new' do
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

    if params[:made_status] && params[:made_status] != :all
      @requests_made = @requests_made.all(status:params[:made_status])
    end
    if params[:received_status] && params[:received_status] != :all
      @requests_received = @requests_received.all(status:params[:received_status])
    end
    erb :'requests/index'
  end

  post '/requests/status' do
    @booking = Booking.get(params[:id])
    @booking.update(status: params[:decision])
    flash.now[:notices] = ["Booking Confirmed!"]
    redirect to '/requests'
  end

  get '/requests/filter' do
    @requests_made = Booking.requests_made_filter(session[:user_id], params[:made_status])
    @requests_received = Booking.requests_received_filter(session[:user_id], params[:received_status])
    erb :'requests/index'
  end
end
