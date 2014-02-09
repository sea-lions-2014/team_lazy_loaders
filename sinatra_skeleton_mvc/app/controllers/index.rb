enable :sessions

get '/:id/surveys' do
  @surveys = Survey.all
  set_user_survey
  erb :all_surveys
end

get '/:id/surveys/new' do
  set_user_survey
  erb :new_survey
end

post '/:id/surveys' do
  params_parser(params)
  redirect "/#{params[:id]}/surveys"
end

get '/:id/surveys/:survey_id' do
  set_user_survey
  erb :survey
end

post '/:id/surveys/:survey_id' do
  if validate_survey(params)
    count_choices(params)
    # redirect "/#{session[:id]}/surveys"
    "ok"
  else
    find_unanswered_questions(params).join(',')
  end
end

get '/thankyou' do
  @id = session[:id]
  erb :thankyou
end

get '/:id/surveys/:survey_id/results' do
  set_user_survey
  erb :survey_results, :layout => false
end

post '/:id/surveys/new/new' do
  @num = params[:num]
  erb :new_question, :layout => false
end

post '/:id/surveys/new/:q_id/new' do
  @num = params[:num]
  @q_num = params[:q_id]
  erb :new_choice, :layout => false
end




