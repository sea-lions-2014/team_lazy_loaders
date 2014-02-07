class Survey < ActiveRecord::Base
	belongs_to :user
	has_many :questions
  # Remember to create a migration!
end
