class QueueManager

  def self.generate_parties
    pool = Person.all
    parties = Party.all

    pool.each do |person|
      possible_parties = find_parties(parties, person.preferences[0])

      if possible_parties.length > 0
        possible_parties[0] << person
        possible_parties[0].save
      else
        puts "this is person preferences #{person.preferences}"
        prt = Party.new
        prt.people << person
        prt.preference = person.preferences[0]

        puts "this is party #{prt.to_yaml}"
        prt.save
        parties << prt
      end
    end
  end

  def self.find_parties (parties, preference)
    parties.collect do |prt|
      if prt.preference == preference && prt.people.length <= prt.max_size
        prt
      else
        nil
      end
    end.compact
  end
end