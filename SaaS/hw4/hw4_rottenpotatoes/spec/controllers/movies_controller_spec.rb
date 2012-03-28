require 'spec_helper'

describe MoviesController do
  describe "a GET to #same_director" do

    context "no director on passed movie" do
      before do
        @movie = Movie.create(:title => "Stuff", :director => nil)
        get 'same_director', :id => @movie.id
      end

      it "redirects to home page" do
        response.should redirect_to movies_url
      end

      it "sets the flash" do
        flash[:notice].should == "'Stuff' has no director info"
      end
    end

    context "valid director" do
      before do
        @movie = Movie.create(:title => "Stuff", :director => 'Bill')
        @movie_with_same_director = Movie.create(:title => "Other Stuff", :director => 'Bill')
        @movie_with_different_director = Movie.create(:title => "More Stuff", :director => 'Bob')

        get 'same_director', :id => @movie.id
      end

      it "sets @movie to the movie searched by" do
        Movie.stub(:find).with(@movie.id).and_return(@movie)
        assigns(:movie).should == @movie
      end

      it "should set @movies to movies with same director" do
        assigns(:movies).should == [@movie, @movie_with_same_director]
      end

      it "renders the same_director view" do
        response.should render_template 'same_director'
      end
    end

  end
end