require 'rails_helper'

describe Movie do
    describe "when movie#same_director is called with valid director" do
        fixtures :movies
        before :each do
            @movie_1 = movies(:movie_1)
            @movie_2 = movies(:movie_2)
            @movie_3 = movies(:movie_3) 
            @movie_4 = movies(:movie_4)
            @movie_5 = movies(:movie_no_director)
        end
        
        it "raises no error if director is set" do
            expect{Movie.same_director(@movie_1.director)}.to_not raise_error(Movie::NoDirectorError) 
        end
        
        it "finds movies with given director" do 
            similiar_movies = Movie.same_director(@movie_1.director)
            expect(similiar_movies).to include(@movie_1,@movie_3,@movie_4)
        end
        
        it "finds no movie with different director" do
            similiar_movies = Movie.same_director(@movie_1.director)
            expect(similiar_movies).to_not include(@movie_2,@movie_5)
            
        end
    end
    
    describe "when movie#same_director is called without director" do
        it "raises an error if director is nil" do
            movie_nil=double('Movie', :director => nil)
            expect{Movie.same_director(movie_nil.director)}.to raise_error(Movie::NoDirectorError) 
        end
        it "raises an error if director is empty" do
            movie_empty=double('Movie', :director => "")
            expect{Movie.same_director(movie_empty.director)}.to raise_error(Movie::NoDirectorError) 
        end
    end
    
    describe "Movie returns correct rating" do
        it "returns ratings" do
            ratings = Movie.all_ratings
            expect(ratings).to include("G","PG","PG-13","R","NC-17")
        end
    end
    
end