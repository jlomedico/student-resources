require 'minitest/autorun'
require './siskel.rb'

class TestSiskel < Minitest::Test
  def test_movie_title
    movie = Siskel.new('Kill Bill')
    assert_equal 'Kill Bill: Vol. 1', movie.title
  end

  def test_movie_rating
    movie = Siskel.new("The Hangover")
    assert_equal "R", movie.rating
  end

  def test_movie_year
    movie = Siskel.new("Blade Runner")
    assert_equal "1982", movie.year
  end

  def test_movie_plot
    movie = Siskel.new("Mean Girls")
    assert_equal "Cady Heron is a hit with The Plastics, the A-list girl clique at her new school, until she makes the mistake of falling for Aaron Samuels, the ex-boyfriend of alpha Plastic Regina George.", movie.plot
  end

  def test_fake_movie_title
    movie = Siskel.new("Walter's Wonderful World, A Very Fake Movie")
    assert_equal "Movie not found!", movie.title
  end

  def test_remake_with_different_year
    movie = Siskel.new("Parent Trap", year: 1961)
    assert_equal "1961", movie.year
  end

  def test_movie_with_full_plot
    movie = Siskel.new("The Parent Trap", plot: :full)
    assert_equal "When two pre-teens named Hallie & Annie meet through their summer camp, their two lives are rattled when they realize that they are identical twins. With parents, British mother aka famous dress designer Elizabeth & American father, a wine maker named Nick, living in two different sides of the universe, the girls decide to make an identity swap in hopes of spending time with their other parent. The girls later choose to aware their guardians of the swap while at a hotel in NYC, which late reunites the divorced pair and sends them back into remarriage with each other.", movie.plot
  end

  # Films with a Metascore between 76 and 100 get two thumbs up.
  # Films with a Metascore between 51 and 75 get a thumbs up.
  # Films with a Metascore between 26 and 50 get a thumbs down.
  # Films with a Metascore between 0 and 25 get two thumbs down.

  def test_movie_consensus_positive
    movie = Siskel.new("The Fifth Element")
    assert_equal "Thumbs Up", movie.consensus
  end

  def test_movie_consensus_negative
    movie = Siskel.new("Fantastic Four")
    assert_equal "Thumbs Down", movie.consensus
  end
end
