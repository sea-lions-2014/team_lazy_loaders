class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string :text
  		t.integer :survey_id
  		t.string :q_type
  	end
  end
end
