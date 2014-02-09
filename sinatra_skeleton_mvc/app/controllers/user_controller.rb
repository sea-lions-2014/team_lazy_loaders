enable :sessions
include BCrypt

get '/' do
  erb :index
end

post '/users' do 
  def create
    p params
    @user = User.new(params)
    @user.password=(params[:password])
    @user.save!
    session[:message] = "You just created yourself a user!"
  end

  create
  redirect '/'
end

post '/sessions' do
  def login
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:logged_in] = true
      session[:message] = "You're signed in"
      session[:id] = @user.id
      redirect "/#{@user.id}/surveys"
    else
      session[:message] = "Your password and/or username was wrong."
      redirect '/'
    end
  end
  login
end

delete '/sessions' do
  session[:logged_in] = false
  session[:id] = nil
  session[:message] = nil
  erb :index
end

