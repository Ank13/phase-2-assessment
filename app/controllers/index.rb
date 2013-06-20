

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user] = @user.id
    redirect '/events'
  else
    @errors = @user.errors
    puts @user.errors.keys
    erb :signup
  end
end

post '/login' do
  if User.authenticate(params[:user][:email], params[:user][:password])
    @user = User.find_by_email(params[:user][:email])
    session[:user] = @user.id
    redirect '/events'
  else
    @errors = {error: "Invalid email or password."}
    erb :login
  end
end
