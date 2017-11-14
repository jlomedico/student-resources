# Don Morehouse

require 'httparty'
require 'pry'
require 'uri'

class Siskel
  attr_reader :title, :rating, :plot, :year, :tomatoes

  def initialize(title, opts = {})
    query = {
      't' => title,
      'tomatoes' => true,
    }

    { 
      'y' => opts[:year],
      'plot' => opts[:plot],
    }.each { |key, value| query[key] = value if value} 

    # Create a query string from a hash using URI module
    q = URI.encode_www_form(query)
    url = "http://www.omdbapi.com/?#{q}"

    @movie = HTTParty.get(url)

    error = @movie["Error"]
    if error
      @title = error
      return error
    end

    keys = [
      'Title',
      'Year',
      'Rated',
      'Plot',
    ]
    @title,
    @year,
    @rating,
    @plot,
    = keys.map { |key| @movie[key] }
  end

  def consensus
    # Films with a tomato meter between 76 and 100 get two thumbs up.
    # Films with a tomato meter between 51 and 75 get a thumbs up.
    # Films with a tomato meter between 26 and 50 get a thumbs down.
    # Films with a tomato meter between 0 and 25 get two thumbs down.
    tomato_meter = @movie['tomatoMeter'].to_i
    [ 
        [(76..100), 'Two Thumbs Up'],
        [(51..75), 'Thumbs Up'],
        [(26..50), 'Thumbs Down'],
        [(0..25), 'Two Thumbs Down'],
        [[nil], 'Thumbs Down'],
    ].map { |range, message| range.include?(tomato_meter) ? message : nil }.compact.last
  end

end
