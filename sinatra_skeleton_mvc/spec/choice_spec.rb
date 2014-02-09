require 'spec_helper'

describe Choice do

  before :all do
    Choice.delete_all
    Question.delete_all
  end

  after :all do
    Choice.delete_all
    Question.delete_all
  end

  describe "choice creation" do

    before :all do
      @question = Question.create(text: "This is a question")
      @choice = Choice.create(text: "This is a choice", question_id: @question.id)
    end

    it "includes text content" do
      expect(@choice.text).not_to eq(nil)
    end

    it "belongs to a question" do
      expect(@choice.question_id).to eq(@question.id)
    end

    it "should have a default count of 0" do
      expect(@choice.count).to eq(0)
    end
  end
end