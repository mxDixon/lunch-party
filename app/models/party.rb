class Party < ActiveRecord::Base
	has_many :people

  def max_size
    #people.max_by(|person| person.seats)
    5
  end

  def min_size
    3
  end


end
