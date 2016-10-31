require_relative 'dm_setup.rb'

class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :surname, String
  property :email, String
  property :password, Text
end