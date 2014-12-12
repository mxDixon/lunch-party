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
        person.assigned = true
        person.save
        matched_party[0].save
      else
        prt = Party.new
        prt.people << person
        person.assigned = true
        person.save
        prt.preference = person.preferences[pref]
        prt.save
        puts "new party #{prt.to_yaml}"

        parties << prt
      end
    end

    refine_orphans

    Party.all.each do |p|
      if p.happy?
        puts "party #{p.id} is happy and should be sending ready msg"
        HipchatMessenger.party_ready(p)
      end
      puts "party #{p.id}"
      p.people.each do |n|
        puts "#{n.name} #{n.id}"
      end
    end
  end

  private

  def self.refine_orphans

    #find sadboys
    sadboys = []
    Party.all.each do |prty|
      if prty.people.size == 1
        sadboys << prty.people.first
        prty.destroy
      end
    end

    #set sadboys unassigned because they're orphans
    sadboys.each do |sb|
      sb.assigned = false
      sb.save
    end

    #twosize = []
    #Party.all.each do |prty|
    #  twosize << prty if prty.people.size == 2
    #end

    #find homes for sadboys with second pref
    find_homes(sadboys, 1)

    #remove sadboys if they found home
    sadboys.each do |sadboy|
      sadboys.delete(sadboy) if sadboy.assigned
    end

    #find homes for sadboys with third pref
    find_homes(sadboys, 2)

    #remove sadboys if they found home again
    sadboys.each do |sadboy|
      sadboys.delete(sadboy) if sadboy.assigned
    end

    #return sadboys so we know who's left
    sadboys
  end

  def self.find_homes(orphans, preference)

    orphans.each do |orphan|
      home = Party.where(preference: orphan.preferences[preference])
      unless home.empty?
        home[0].people << orphan
        orphan.assigned = true
        orphan.save
      end
    end
  end
end