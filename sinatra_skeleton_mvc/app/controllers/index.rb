enable :sessions



get '/:id/surveys' do
  @survey = Survey.all
  erb :index
end

get '/surveys/new' do
  erb :new_survey
end

post '/surveys' do
  params_parser(params)
  redirect '/'
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

post '/surveys/:id' do
  count_choices(params)
  redirect "/"
end

get '/surveys/:id/results' do
  @survey = Survey.find(params[:id])
  erb :survey_results
end
