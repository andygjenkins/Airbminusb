require_relative 'dm_setup'

class Place
  include DataMapper::Resource

  belongs_to :user
  has n, :bookings

  property :id, Serial
  property :name, String, required: true
  property :price, Integer, required: true
  property :description, Text, length: 0..250
  property :start_availability, Date
  property :end_availability, Date

  validates_presence_of :name, :price
end