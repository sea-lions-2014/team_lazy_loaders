class CreateChoices < ActiveRecord::Migration
  def change
  	create_table :choices do |t|
  		t.string :text
  		t.integer :count, :default => 0
  		t.integer :question_id
  		t.integer :percentage, :default => 0
  	end
  end
end
