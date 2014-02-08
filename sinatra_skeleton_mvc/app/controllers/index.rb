enable :sessions



get '/:id/surveys' do
  @survey = Survey.all
  erb :all_surveys
end

get '/:id/surveys/new' do
  @id = params[:id]
  erb :new_survey
end

post '/:id/surveys' do
  params_parser(params)
  redirect "/#{params[:id]}/surveys"
end

get '/:id/surveys/:survey_id' do
  @id = params[:id]
  @survey = Survey.find(params[:survey_id])
  erb :survey
end

post '/:id/surveys/:survey_id' do
  count_choices(params)
  redirect "/"
end

get '/:id/surveys/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  erb :survey_results
end
