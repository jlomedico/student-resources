# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

message_list = [
  [ "Great Service", "Some text about great service"],
  [ "Terrible Service", "Some text about terrible service"],
  [ "Okay Service", "Some text about okay service"],
  [ "Bad Service", "Some text about bad service"]
]

comments_list = [
  [ "I agree", 1],
  [ "I disagree", 1],
  [ "I'm unsure", 1],
  [ "I agree", 2],
  [ "I disagree", 2],
  [ "I'm unsure", 2],
  [ "I agree", 3],
  [ "I disagree", 3],
  [ "I'm unsure", 3],
  [ "I agree", 4],
  [ "I disagree", 4],
  [ "I'm unsure", 4],
]

message_list.each do |topic, body|
  Message.create(topic: topic,
  body: body)
end

comments_list.each do |body, message_id|
  Comment.create(body: body,
    message_id: message_id)
end
