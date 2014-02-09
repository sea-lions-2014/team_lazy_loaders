helpers do
  include BCrypt

  def current_user 
    User.find(session[:id]) if session[:logged_in]
  end

  def set_user_survey
    @id = params[:id] if params[:id]
    @survey = Survey.find(params[:survey_id ]) if params[:survey_id]
  end 

  def count_choices(params)
    params.select {|key| key.match(/\d/) != nil}.each do |choice|
      choice = Choice.find(choice[0].to_i)
      new_count = choice.count + 1
      choice.update_attributes(count: new_count)
    end
  end

  def params_parser(params)
    survey = Survey.create(name: params[:title], user_id: session[:id]) 
    counter = 0
    parse_questions(get_parameter(params, "question"), survey)
  end

  private

  def get_parameter(params, matcher)
    params.select {|key| key.include?(matcher)}
  end

  def parse_questions(questions, container)
    counter = 0
    questions.each do |question|
      new_question = Question.create(text: question[1]) 
      container.questions << new_question 

      get_parameter(params, counter.to_s + 'choice').each do |choice|
        new_choice = Choice.create(text: choice[1]) 
        new_question.choices << new_choice 
      end
      counter += 1
    end
  end

  




end
