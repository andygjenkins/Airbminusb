require_relative 'dm_setup'

class Place
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :name, String, required: true
  property :price, Integer, required: true
  property :description, Text, length: 0..250 

  validates_presence_of :name, :price
end