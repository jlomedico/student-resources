require 'httparty'

class Siskel
  attr_reader :title,
              :rating,
              :year,
              :plot,
              :consensus

  def initialize(title, options={})
    year = options[:year]
    plot_length = options[:plot].to_s

    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{year}&plot=#{plot_length}&tomatoes=true")
    @title = get_movie_title
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
  end

  def get_movie_title
    @movie['Error'] ? @movie['Error'] : @movie['Title']
  end

  def consensus
    ratings.each do |range, rating|
      return rating if range.cover? @movie["tomatoMeter"].to_i
    end
  end

  def ratings
    { 76..100 => "Two Thumbs Up.",
      51..75 => "Thumbs Up",
      26..50 => "Thumbs Down",
      0..25 => "Two Thumbs Down."
    }
  end
end

