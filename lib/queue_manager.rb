class QueueManager

  def self.generate_parties
    pool = Person.all
    parties = Party.all

    pool.each do |person|
      next if person.assigned

      possible_parties = find_parties(parties, person.preferences[0])
      puts possible_parties.length

      if possible_parties.length > 0
        puts "found possible parties"
        possible_parties[0].people << person
        possible_parties[0].save
      else
        puts "this is person preferences #{person.preferences}"
        prt = Party.new
        prt.people << person
        prt.preference = person.preferences[0]

        puts "this is new party #{prt.to_yaml}"
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