class Party < ActiveRecord::Base
	has_many :people

  attr_reader :zombies

  def max_size
    #people.max_by(|person| person.seats)
    5
  end

  def min_size
    3
  end

  def happy?
    if people.length > min_size
      true
    else
      false
    end
  end

  def ready?
    if self.status == 'ready'
      true
    else
      check_ready
    end
  end

  def kill_the_people
    @zombies = []
    people.each do |p|
      @zombies << p.name
      p.destroy
    end
  end

  def check_ready
    peeps_ready = 0

    people.each do |p|
      peeps_ready+= 1 if p.ready?
    end

    if peeps_ready == people.length
      kill_the_people
      self.status = 'ready'
      self.save
      true
    else
      false
    end
  end

  def add(person)
    person.assigned = true
    person.save
    people << person
    save
  end

end
