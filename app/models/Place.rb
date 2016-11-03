class Place
  include DataMapper::Resource

  belongs_to :user
  has n, :bookings

  property :id, Serial
  property :name, String, required: true
  property :price, Integer, required: true
  property :description, Text, length: 0..250
  property :start_availability, Date, required: true
  property :end_availability, Date, required: true

  validates_presence_of :name, :price

  def within_available_range?(date)
    (date >= self.start_availability) && (date <= self.end_availability)
  end

  def self.booked_dates(place_id)
    place = Place.first(id: place_id)
    bookings = Booking.all(place: place, status: :confirmed)
    booked_dates_array = []
    bookings.each do |booking|
      booked_dates_array << booking.date
    end
    booked_dates_array
  end



end
