require 'spec_helper'

describe Question do

  before :all do
    Question.delete_all
    Survey.delete_all
  end

  after :all do
    Question.delete_all
    Survey.delete_all
  end

  describe "question creation" do
    before :all do
      @question = Question.create(text: "This is a question?")
      @survey = Survey.create(name: "This is a survey!")
      @survey.questions << @question
    end

    it "contains text" do
      expect(@question.text).not_to eq(nil)
    end

    it "belongs to a survey" do
      expect(@question.survey_id).to eq(@survey.id)
    end
  end
end