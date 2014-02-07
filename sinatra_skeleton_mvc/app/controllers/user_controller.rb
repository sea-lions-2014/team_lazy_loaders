enable :sessions
# include BCrypt

post '/users' do 
  User.create(params)
  session[:id] = User.find_by_username(params[:username]).id
  redirect '/'
end