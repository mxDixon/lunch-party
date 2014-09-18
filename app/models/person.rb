class Person < ActiveRecord::Base

	attr_accessor :preferences, :status, :name, :assigned
	serialize :preferences, Array

end
