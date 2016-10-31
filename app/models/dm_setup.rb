require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'User'
require_relative 'Place'
require_relative 'Booking'

DataMapper.setup(:default, "postgres:///airbminusb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_update!