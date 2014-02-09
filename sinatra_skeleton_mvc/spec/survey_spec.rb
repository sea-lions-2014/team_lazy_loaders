require 'spec_helper'

describe Survey do
  before :all do
    Survey.delete_all
    Question.delete_all
    User.delete_all
  end

  after :all do
    Survey.delete_all
    Question.delete_all
    User.delete_all
  end

  describe "survey creation" do
    before :all do
      @user = User.create(username:'bob')
      @survey = Survey.create(name:'generic_survey', user_id: @user.id)
    end

    it "has a name" do
      expect(@survey.name).not_to eq(nil)
    end

    it "can belong to a user" do
      expect(@survey.user_id).not_to eq(nil)
    end

    it "can have many questions" do
      random_number = rand(10) + 1
      random_number.times do
        question = Question.create(text: "this is a question?")
        @survey.questions << question
      end
      expect(@survey.questions.length).to eq(random_number)
    end
  end
end