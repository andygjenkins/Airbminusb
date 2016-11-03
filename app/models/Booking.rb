class Booking
  include DataMapper::Resource

  belongs_to :user
  belongs_to :place

  property :id, Serial
  property :date, Date
  property :status, Enum[:pending, :confirmed, :rejected, :cancelled], default: :pending

  validates_presence_of :date

  def self.requests_made(user_id)
    Booking.all(user_id: user_id)
  end

  def self.requests_received(user_id)
    Booking.all(place: Place.all(user_id: user_id))
  end
    
  def self.reject_conflicting_and_confirm(booking)
    other_bookings = Booking.all(place: booking.place, date: booking.date, status: [:pending, :confirmed])
    other_bookings.update(status: :rejected)
    booking.update(status: :confirmed)
  end
end
