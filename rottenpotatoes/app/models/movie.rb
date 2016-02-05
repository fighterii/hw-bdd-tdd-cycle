class Movie < ActiveRecord::Base
  class Movie::NoDirectorError < StandardError ; end
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.same_director(director)
    raise NoDirectorError unless !(director.nil? || director.empty?)
    Movie.where(:director => director)
  end
end
