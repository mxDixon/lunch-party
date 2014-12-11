class Person < ActiveRecord::Base

	serialize :preferences, Array

  attr_accessor :has_confirmed

  def initialize
    @has_confirmed = false
  end

  def ready?
    has_confirmed
  end

end
