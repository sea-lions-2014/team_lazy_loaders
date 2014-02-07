helpers do
  # include BCrypt
  def em(text)
    "<em>#{text}</em>"
  end

  def create_user
    @user = User.new(params)
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:logged_in] = true
      session[:message] = nil
      session[:id] = @user.id
      erb :index
    else
      # session[:logged_in] = false
      session[:message] = "Your password and/or username was wrong.  Sucks to be you."
      erb :sign_in
    end
  end

end
