enable :sessions
include BCrypt

get '/' do
  erb :index
end

post '/users' do 
  def create
    p params
    #CR move logic for password setting to model
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
    #CR move logic for authentication to model
    if @user.password == params[:password]
      session[:logged_in] = true
      session[:message] = "You're signed in"
      session[:id] = @user.id
      redirect "/#{@user.id}/surveys"
    else
      #CR Use error messages from validations instead of sessions here. 
      session[:message] = "Your password and/or username was wrong."
      redirect '/'
      #CR use render (erb) stay on the same page if wrong so user can fix errors. 
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

