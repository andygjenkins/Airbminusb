class Airbminusb < Sinatra::Base

  post 'requests/new' do
    @booking = Booking.create(params)
    redirect to '/requests'
    flash[:notice] << "You have requested to stay at #{@booking.place.name} on #{@booking.date}"
  end


end
