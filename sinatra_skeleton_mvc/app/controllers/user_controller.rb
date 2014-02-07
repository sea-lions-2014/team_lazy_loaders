enable :sessions
include BCrypt

post '/users' do 
  User.create(params)

  # def create
  #   p params
  #   @user = User.new(params)
  #   @user.password=(params[:password])
  #   @user.save!
  # end

  # create

  # session[:id] = User.find_by_username(params[:username]).id
  redirect '/'
end