enable :sessions
include BCrypt

post '/users' do 
  # User.create(params)

  def create
    p params
    @user = User.new(params)
    @user.password=(params[:password])
    @user.save!
    session[:message] = "You just created yourself a user!"
  end

  create

  # session[:id] = User.find_by_username(params[:username]).id
  redirect '/'
end

post '/sessions' do
  def login
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:logged_in] = true
      session[:message] = "You're signed in"
      session[:id] = @user.id
    else
      session[:message] = "Your password and/or username was wrong."
    end
  end
  login
  redirect '/'
end