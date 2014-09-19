class QueueManager

  def self.generate_parties(unassigned_people, existing_parties, pref = 0)
    people = unassigned_people
    parties = existing_parties

    people.each do |person|
      next if person.assigned

      matched_party = Party.where(preference: person.preferences[pref])
      puts "matched party is #{matched_party.class} that is #{matched_party}"
      if matched_party.length > 0
        puts "found a party"
        matched_party[0].people << person
        matched_party[0].save
      else
        prt = Party.new
        prt.people << person
        prt.preference = person.preferences[pref]
        prt.save
        puts "new party #{prt.to_yaml}"

        parties << prt
      end
    end

    refine_orphans
    
    Party.all.each do |p|
      puts "party #{p.id}"
      p.people.each do |n|
        puts "#{n.name} #{n.id}"
      end
    end
  end

  private

  def refine_orphans
    sadboys = []

    Party.all.each do |prty|
      sadboys << prty.people.first if prty.people.size == 1
      prty.destroy
    end

    find_homes(sadboys, 1)

    sadboys.each do |sadboy|
      sadboys.delete(sadboy) if sadboy.assigned
    end

    find_homes(sadboys, 2)

  end

  def find_homes(orphans, preference)

    orphans.each do |orphan|
      home = Party.where(preference: orphan.preferences[preference])
      unless home.empty?
        home[0] << orphan
        orphan.assigned = true
      end
    end
  end
end