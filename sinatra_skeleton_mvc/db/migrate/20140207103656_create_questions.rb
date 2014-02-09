class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string :text
  		t.integer :survey_id
  		t.string :type
  	end
  end
end
