require 'httparty'

class Siskel
  attr_accessor :title, :year, :rating, :plot

  def initialize(title, opts = {})
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{opts[:year]}&plot=#{opts[:plot]}?tomatoes=true")
    @rating = @movie["Rated"]
    @title = @movie["Title"] || @movie["Error"]
    @year = @movie["Year"]
    @plot = @movie["Plot"]
    @tomatoes = @movie["tomatoMeter"]
  end

  def concensus
    case @tomatoes.to_i
    when 76..100 then "Two Thumbs Up"
    when 51..75 then "Thumbs Up"
    when 26..50 then "Thumbs Down"
    else "Two Thumbs Down"
    end
  end
end
