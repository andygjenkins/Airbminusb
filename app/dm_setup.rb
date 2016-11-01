require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/User'
require_relative 'models/Place'
require_relative 'models/Booking'

DataMapper.setup(:default, "postgres:///airbminusb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
