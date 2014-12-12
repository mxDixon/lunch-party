require 'foodcats'
require 'queue_manager'

class QueueController < ApplicationController
  def index
  end

  def add
  end

  def remove
  end

  def destroy
    begin
      peep = Person.find_by(:name => params[:person][:name])
      peep.destroy
    rescue ActiveRecord::RecordNotUnique
      redirect_to action: 'add', alert: 'That user is already in queue!'
    rescue => e
      Logger.log('EXCEPTION::')
      Logger.log(e.to_yaml)
      redirect_to action: 'error'
    end

    redirect_to action: 'bye'
  end

  def personify
    begin
      pref = params[:person]
      peep = Person.new
      peep.preferences = [pref[:pref1].to_i, pref[:pref2].to_i, pref[:pref3].to_i]
      peep.name = params[:person][:name]
      puts peep.to_yaml
      peep.save!

      QueueManager.generate_parties(Person.all, Party.all)

      redirect_to action: 'success'
    rescue ActiveRecord::RecordNotUnique => e
      flash[:notice] = 'That user is already in queue!'
      redirect_to action: 'add'
    rescue ActiveRecord::RecordInvalid => e
      flash[:notice] = 'That user is already in queue!'
      redirect_to action: 'add'
    rescue => e
      logger.error 'EXCEPTION::'
      logger.info e.to_yaml
      redirect_to action: 'error'
    end
  end

  def success
  end

  def bye
  end

  def error
  end
end
