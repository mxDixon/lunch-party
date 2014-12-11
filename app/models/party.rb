class Party < ActiveRecord::Base
	has_many :people

  attr_reader :ready, :zombies

  def initialize
    @ready = false
  end

  def max_size
    #people.max_by(|person| person.seats)
    5
  end

  def min_size
    3
  end

  def ready?
    if @ready
      @ready
    else
      check_ready
    end
  end

  def kill_the_people
    @zombies = []
    people.each do |p|
      @zombies << p.name
      p.delete
    end
  end

  def check_ready
    peeps_ready = 0

    people.each do |p|
      peeps_ready+= 1 if p.ready?
    end

    if peeps_ready == people.length
      @ready = true
      kill_the_people
      true
    else
      false
    end
  end

end
