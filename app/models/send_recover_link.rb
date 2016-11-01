require 'mailgun'

class SendRecoverLink

 def initialize(mailer: nil)
   @mailer = mailer || Mailgun::Client.new(ENV['pubkey-e75263f4d7913c1240d4e8522a83fc10'])
 end

 def self.call(user, mailer = nil)
   new(mailer: mailer).call(user)
 end

 def call(user)
   mailer.send_message(ENV["mailgun_domain_name"], {from: "airbminusb@mail.com",
       to: user.email,
       subject: "reset your password",
       text: "click here to reset your password http://yourherokuapp.com/reset_password?token=#{user.password_token}" })
 end

 private
 attr_reader :mailer
end
