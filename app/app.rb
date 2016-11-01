ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'dm_setup'

require_relative 'server'
require_relative 'controllers/bookings'
require_relative 'controllers/places'
require_relative 'controllers/requests'
require_relative 'controllers/sessions'
require_relative 'controllers/user'