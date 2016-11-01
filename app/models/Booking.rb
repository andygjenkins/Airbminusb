class Booking
  include DataMapper::Resource

  belongs_to :user
  belongs_to :place

  property :id, Serial
  property :date, Date
  property :confirmed, Boolean, default: false

  validates_presence_of :date



end
