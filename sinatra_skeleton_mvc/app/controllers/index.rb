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
  count_choices(params)
  redirect "/#{session[:id]}/surveys"
end

get '/:id/surveys/:survey_id/results' do
  set_user_survey
  erb :survey_results
end

post '/:id/surveys/new/new' do
  @num = params[:num]
  erb :new_question, :layout => false
end

post '/:id/surveys/new/:q_id/new' do
  @num = params[:num]
  @q_num = params[:q_num]
  erb :new_choice, :layout => false
end




