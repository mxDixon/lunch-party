# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create(name: 'Gonzo', assigned: false, preferences:[1,2,3], status:'')
Person.create(name: 'Steve', assigned: false, preferences:[4,2,3], status:'')
Person.create(name: 'Joe', assigned: false, preferences:[2,3,4], status:'')
Person.create(name: 'Bruno', assigned: false, preferences:[5,4,3], status:'')
Person.create(name: 'Sergey', assigned: false, preferences:[6,3,1], status:'')
Person.create(name: 'Boris', assigned: false, preferences:[7,6,5], status:'')
Person.create(name: 'Franko', assigned: false, preferences:[2,4,1], status:'')
Person.create(name: 'Jeremy', assigned: false, preferences:[6,8,2], status:'')
Person.create(name: 'Bart', assigned: false, preferences:[3,4,2], status:'')
Person.create(name: 'Jennay', assigned: false, preferences:[7,6,3], status:'')
Person.create(name: 'Pam', assigned: false, preferences:[8,7,6], status:'')
Person.create(name: 'Carol', assigned: false, preferences:[5,2,4], status:'')
Person.create(name: 'Bubba', assigned: false, preferences:[4,5,8], status:'')
Person.create(name: 'Crystal', assigned: false, preferences:[7,8,2], status:'')
