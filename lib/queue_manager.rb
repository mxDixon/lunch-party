class QueueManager

  def self.generate_parties
    pool = Person.all
    parties = Party.all

    pool.each do |person|
      next if person.assigned

      matched_party = Party.where(preference: person.preferences[0])
      puts "matched party is #{matched_party.class} that is #{matched_party}"
      if matched_party.length > 0
        puts "found a party"
        matched_party[0].people << person
        matched_party[0].save
      else
        prt = Party.new
        prt.people << person
        prt.preference = person.preferences[0]
        prt.save
        puts "new party #{prt.to_yaml}"

        parties << prt
      end
    end

    Party.all.each do |p|
      puts "party #{p.id}"
      p.people.each do |n|
        puts "#{n.name} #{n.id}"
      end
    end
  end
end