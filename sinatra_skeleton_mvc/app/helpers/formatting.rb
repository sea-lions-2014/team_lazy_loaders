helpers do
  include BCrypt

  def current_user
     # TODO: return the current user if there is a user signed in.
    User.find(session[:id]) if session[:logged_in]
  end

  def params_parser(params)
    survey = Survey.create(name: params[:title], user_id: session[:id]) # creates survey out of title input
    counter = 0
    parse_questions(get_parameter(params, "question"), survey)
  end

  def get_parameter(params, matcher)
    params.select {|key| key.include?(matcher)}
  end

  def parse_questions(questions, container)
    counter = 0
    questions.each do |question|
      new_question = Question.create(text: question[1]) # creates a new question for each found param
      container.questions << new_question # puts it into survey

      get_parameter(params, counter.to_s + 'choice').each do |choice|
        new_choice = Choice.create(text: choice[1]) #creates a new choice
        new_question.choices << new_choice # puts choice in the question
      end
      counter += 1
    end
  end

  def count_choices(params)
    params.select {|key| key.match(/\d/) != nil}.each do |choice|
      choice = Choice.find(choice[0].to_i)
      new_count = choice.count + 1
      choice.update_attributes(count: new_count)
    end
  end

  # def login
  #   @user = User.find_by_username(params[:username])
  #   if @user.password == params[:password]
  #     session[:logged_in] = true
  #     session[:message] = nil
  #     session[:id] = @user.id
  #     erb :index
  #   else
  #     # session[:logged_in] = false
  #     session[:message] = "Your password and/or username was wrong.  Sucks to be you."
  #     erb :sign_in
  #   end
  # end


end
