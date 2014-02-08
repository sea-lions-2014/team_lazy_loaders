helpers do
  def em(text)
    "<em>#{text}</em>"
  end


  def params_parser(params)
    survey = Survey.create(name: params[:title]) # creates survey out of title input
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

end
