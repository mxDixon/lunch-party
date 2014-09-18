class Party < ActiveRecord::Base
	has_many :people
	attr_accessor :preference, :status, :min_size, :max_size, :people

  def initialize args
    people = args[:people]
    preference = args[:preference]
  end

  def max_size
    #people.max_by(|person| person.seats)
    5
  end


end
