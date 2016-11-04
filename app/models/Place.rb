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

  validates_with_method :start_availability, :method => :check_start_date
  validates_with_method :end_availability, :method => :check_end_date

  def check_start_date
    if self.start_availability >= Date.today
      return true
    else
      [false, "You can't list for a past date"]
    end
  end

  def check_end_date
    if self.end_availability >= self.start_availability
      return true
    else
      [false, "End availability can't be before start availability"]
    end
  end

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

  def start_or_today
    [Date.today, self.start_availability].max
  end


end
