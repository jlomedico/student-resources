require 'httparty'

class Siskel
  attr_reader :title

  def initialize(title)
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}")
    @title = @movie['Title']
  end
end
