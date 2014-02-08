get '/surveys' do
  # Look in app/views/index.erb
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
  p params
  count_choices(params)
  redirect "/"
end

get '/surveys/:id/results' do
  @survey = Survey.find(params[:id])
  erb :survey_results
end
