require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/User'
require_relative 'models/Place'
require_relative 'models/Booking'
require_relative 'models/send_recover_link'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/airbminusb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
