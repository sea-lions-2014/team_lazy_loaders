class User < ActiveRecord::Base
	has_many :surveys
  # Remember to create a migration!
end
