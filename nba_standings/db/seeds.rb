Team.destroy_all

team_list = [
  ["Atlanta", "Hawks", "Eastern", 21, 14],
  ["Boston", "Celtics", "Eastern", 18, 15],
  ["Brooklyn", "Nets", "Eastern", 10, 23],
  ["Charlotte", "Hornets", "Eastern", 17, 16],
  ["Chicago", "Bulls", "Eastern", 20, 12],
  ["Cleveland", "Cavaliers", "Eastern", 22, 9],
  ["Dallas", "Mavericks", "Western", 19, 15],
  ["Denver", "Nuggets", "Western", 12, 23],
  ["Detroit", "Pistons", "Eastern", 18, 16],
  ["Golden State", "Warriors", "Western", 31, 2],
  ["Houston", "Rockets", "Western", 16, 19],
  ["Indiana", "Pacers", "Eastern", 19, 14],
  ["Los Angeles", "Clippers", "Western", 22, 13],
  ["Los Angeles", "Lakers", "Western", 8, 27],
  ["Memphis", "Grizzlies", "Western", 18, 17],
  ["Miami", "Heat", "Eastern", 20, 13],
  ["Milwaukee", "Bucks", "Eastern", 14, 21],
  ["Minnesota", "Timberwolves", "Western", 12, 22],
  ["New Orleans", "Pelicans", "Western", 11, 22],
  ["New York", "Knicks", "Eastern", 16, 19],
  ["Oklahoma City", "Thunder", "Western", 24, 10],
  ["Orlando", "Magic", "Eastern", 19, 15],
  ["Philadelphia", "76ers", "Eastern", 3, 33],
  ["Phoenix", "Suns", "Western", 12, 25],
  ["Portland", "Trailblazers", "Western", 15, 21],
  ["Sacramento", "Kings", "Western", 13, 20],
  ["San Antonio", "Spurs", "Western", 29, 6],
  ["Toronto", "Raptors", "Eastern", 21, 14],
  ["Utah", "Jazz", "Western", 15, 17],
  ["Washington", "Wizards", "Eastern", 15, 17]
]

team_list.each do |city, nickname, conference, wins, losses|
  Team.create( city: city, nickname: nickname, conference: conference, wins: wins, losses: losses)
end
