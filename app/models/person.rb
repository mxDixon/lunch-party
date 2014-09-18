class Person < ActiveRecord::Base

	serialize :preferences, Array

end
