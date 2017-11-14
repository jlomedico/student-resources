require 'httparty'

class Siskel
  def initialize(title, options={})
    if options[:plot]
      @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=options[:year]&plot=full&tomatoes=true")
    else
      @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=options[:year]&tomatoes=true")
    end

    if @movie['Error']
      @title = @movie['Error']
    else
      @title = @movie['Title']
    end

    @rating = @movie['Rated']

    if options[:year]
      @year = options[:year].to_s
    else
      @year = @movie['Year']
    end

    @plot = @movie['Plot']
  end

  def title
    @title
  end

  def rating
    @rating
  end
  def year
    @year
  end

  def plot
    @plot
  end

  def consensus
    @consensus
  end

  def consensus
    case @movie["tomatoMeter"].to_i
    when 76..100
      "Two Thumbs Up."
    when 51..75
      "Thumbs Up"
    when 26..50
      "Thumbs Down"
    when 0..25
      "Two Thumbs Down."
    else
      "No rating available"
    end
  end
end

