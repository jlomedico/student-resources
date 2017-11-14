require 'sinatra'
require './card.rb'
require './deck.rb'

MY_DECK = Deck.new

get '/' do
  MY_DECK.draw.to_s
end
