# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

groups = [
  {
    name: "Fugazi",
    genre: "Rock"
  },
  {
    name: "NoMeansNo",
    genre: "Punk"
  },
  {
    name: "Nations of Ulysses",
    genre: "Punk"
  },
  {
    name: "The Melvins",
    genre: "Proto-Grunge"
  },
  {
    name: "Os Mutantes",
    genre: "Brazilian Rock"
  },
  {
    name: "Arbouretum",
    genre: "Folk Doom"
  },
  {
    name: "Ui",
    genre: "Experimental Rock"
  }
]

artists = [
  "Sasha Frere-Jones",
  "Ian Mackaye",
  "Buzz Osborne",
  "Ian Svenonius"
]

groups.each do |group|
  Group.create group
end

artists.each do |artist|
  Artist.create name: artist
end
