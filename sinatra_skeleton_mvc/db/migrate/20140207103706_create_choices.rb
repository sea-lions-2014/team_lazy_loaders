class CreateChoices < ActiveRecord::Migration
  def change
  	create_table :choices do |t|
  		t.string :text
  		t.integer :count
  		t.integer :question_id
  	end
  end
end
