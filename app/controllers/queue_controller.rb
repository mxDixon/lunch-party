require 'foodcats'
require 'queue_manager'

class QueueController < ApplicationController
  def index
  end

  def add
  end

  def remove
  end

  def generate
    QueueManager.clear_and_generate
    redirect_to action: index
  end

  def destroy
    begin
      peeps = Person.where(name: params[:person][:name])
      peeps.to_yaml
      peeps.first.destroy
      redirect_to action: 'bye'
    rescue ActiveRecord::RecordNotUnique
      redirect_to action: 'add', alert: 'That user is already in queue!'
    rescue => e
      logger.error 'EXCEPTION::'
      logger.info e.to_yaml
      redirect_to action: 'error'
    end
  end

  def personify
    begin
      pref = params[:person]
      peep = Person.new
      peep.preferences = [pref[:pref1].to_i, pref[:pref2].to_i, pref[:pref3].to_i]
      peep.name = params[:person][:name]
      peep.save!

      # QueueManager.generate_parties(Person.all, Party.all)

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
