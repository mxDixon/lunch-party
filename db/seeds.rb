# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create(name: '@cdix', assigned: false, preferences:[1,2,3], status:'')
Person.create(name: '@DavidDemar', assigned: false, preferences:[1,2,3], status:'')
Person.create(name: '@ToddWisher', assigned: false, preferences:[1,3,2], status:'')
Person.create(name: '@ChuyaGuo', assigned: false, preferences:[1,3,2], status:'')
Person.create(name: '@JoshAtwood', assigned: false, preferences:[2,3,1], status:'')
Person.create(name: '@AaronKillen', assigned: false, preferences:[2,1,3], status:'')
