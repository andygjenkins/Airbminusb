class Airbminusb < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb

  enable :partial_underscores

  get '/' do
    if current_user
      redirect to '/places/listings'
    else
      redirect to '/sessions/sign_in'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
