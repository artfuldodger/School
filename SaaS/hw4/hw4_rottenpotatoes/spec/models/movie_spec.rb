require 'spec_helper'

describe Movie do
  describe "#movies_with_same_director" do
    it "calls Movie.where with the movie's director" do
      movie = Movie.create(:title => "A Movie", :director => "Some Guy")
      Movie.should_receive(:where).with(:director => "Some Guy")
      movie.movies_with_same_director
    end
  end
end