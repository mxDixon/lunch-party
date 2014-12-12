class QueueManager

  def self.clear_and_generate
    puts "============================================================================="
    puts "======================  Fresh party generation  ============================="
    puts "============================================================================="

    Person.all.each do |p|
      p.unassign
    end

    Party.destroy_all

    self.generate_parties(Person.all, Party.all)
  end

  def self.generate_parties(unassigned_people, existing_parties, pref = 0)
    people = unassigned_people
    parties = existing_parties

    people.each do |person|
      next if person.assigned

      matched_party = Party.where(preference: person.preferences[pref])

      if matched_party.length > 0
        matched_party[0].add(person)
      else
        prt = Party.new
        prt.preference = person.preferences[pref]
        puts "adding #{person.name} to party #{prt.id}"
        prt.add(person)
        puts "party people after: #{prt.people.to_yaml}"
        parties << prt
      end
    end

    refine_orphans(pref)
  end

  def self.timeout_parties
    Party.all.each do |p|
      boot_lames(p)

      if p.happy? && p.check_ready
        HipchatMessenger.leave_now(p)
      else
        HipchatMessenger.requeue(p)
        p.people.each do |peep|
          peep.unassign
        end
        p.destroy
      end
    end
  end

  private

  def self.boot_lames(party)
    party.people.each do |p|
      p.destroy unless p.ready?
    end
  end

  def self.refine_orphans(pref)

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
      sb.unassign
      sb.save
    end

    if pref < 1
      generate_parties(sadboys, Party.all, pref+1)
    else
      last_resort(sadboys)
      puts "blasting"
      blast
    end
  end

  def self.last_resort(sadboys)
    sadboys.each do |sb|
      matched_parties = Party.where(:preference => sb.preferences)
      parties = matched_parties.to_a
      parties.map! do |p|
        p if p.people.length < p.max_size
      end.compact
      puts "matched parties for last resort #{parties.to_yaml}"

      parties.first.add(sb) if parties.length > 0
    end
  end

  def self.blast
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
end