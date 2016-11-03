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

  def self.requests_made_filter(user_id, status)
    Booking.all(user_id: user_id) & Booking.all(status: status)
  end

  def self.requests_received_filter(user_id, status)
    Booking.all(place: Place.all(user_id: user_id)) & Booking.all(status: status)
  end
end
