class Airbminusb < Sinatra::Base

  get '/users/sign_up' do
      @user = User.new
      erb :'users/sign_up'
    end

  post '/sign_up' do
    @user = User.create(first_name: params[:first_name],
                        surname: params[:surname],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/sign_up'
    end
  end


end
