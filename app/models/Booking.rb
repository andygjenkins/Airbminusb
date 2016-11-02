class Booking
  include DataMapper::Resource

  belongs_to :user
  belongs_to :place

  property :id, Serial
  property :date, Date
  property :confirmed, Boolean, default: false

  validates_presence_of :date

  def self.requests_made(user_id)
    Booking.all(user_id: user_id)
  end

  def self.requests_received(user_id)
    Booking.all(place: Place.all(user_id: user_id))
  end
end