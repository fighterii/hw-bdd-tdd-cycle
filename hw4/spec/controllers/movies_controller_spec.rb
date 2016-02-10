require 'rails_helper'

describe MoviesController do
    describe "when the specified movie has a director show similiar movies page" do
        fixtures :movies
        before :each do
            @a_movie = movies(:movie_1)
        end
        it "calls method on movie" do
            #test that the method in the model gets called
            a_movie = movies(:movie_1)
            Movie.should_receive(:same_director).with(a_movie.director)
                #execute the search directors path, passingin a_director
            get :same_director, {:id => a_movie}
            
        end
        it "assigns retrieved movies to instance variable for view" do
            a_movie = movies(:movie_1)
            Movie.should_receive(:same_director).with(a_movie.director).and_return([:movie_3,:movie_4])
            subject = get :same_director, {:id => a_movie}
            assigns(:similiar_movies).should == [:movie_3,:movie_4]
        end
        it "renders same_director view" do
            #Movie.stub(:same_director)
            subject = get :same_director, {:id => @a_movie}
            expect(subject).to render_template('same_director')
        end
    end
    describe "when the specified movie has no director then redirect to homepage" do
        fixtures :movies
        it "rescues error and redirects to homepage" do
            a_movie = movies(:movie_no_director)
            Movie.should_receive(:same_director).with(a_movie.director).and_raise(Movie::NoDirectorError)
            #expect(result).to eq nil
            subject = get :same_director, {:id => a_movie}
            expect(subject).to redirect_to(movies_path)
        end
    end
end