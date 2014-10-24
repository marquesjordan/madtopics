# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = Question.create([{topic: 'Lakers', enigma: "Is Kobe Bryant the best player ever?"}, {topic: 'General Assembly', enigma: "Will I get a high paying job after I graduate?"}])