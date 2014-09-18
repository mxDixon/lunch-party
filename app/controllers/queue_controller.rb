require 'foodcats'
require 'queue_manager'

class QueueController < ApplicationController
  def index
  end

  def personify
    #todo do the person create and enqueue
    pref = params[:person]
    peep = Person.new
    peep.preferences = [pref[:pref1], pref[:pref2], pref[:pref3]]
    peep.name = params[:person][:name]
    peep.save
    puts "this is id #{peep.id}"

    QueueManager.generate_parties

  end

  def wait
  end

  def party
  end
end
