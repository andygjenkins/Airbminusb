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

class Airbminusb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/sessions/sign_in' do
    erb :sign_in
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
