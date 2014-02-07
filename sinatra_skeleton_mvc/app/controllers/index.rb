get '/' do
  # Look in app/views/index.erb
  @survey = Survey.all
  erb :index
end

get '/survey/new' do
  erb :new_survey
end

post '/survey' do
  survey = Survey.create(name: params[:title])
  question = Question.create(text: params[:question])
  choice1 = Choice.create(text: params[:choice1])
  choice2 = Choice.create(text: params[:choice2])
  survey.questions << question
  question.choices << choice1
  question.choices << choice2
  redirect '/'
end
# make restful