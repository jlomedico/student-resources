class PokesController < ApplicationController
  def index
    @pokes = Pokemon.all
  end
end
