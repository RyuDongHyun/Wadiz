class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
  end

  def create
  end
  
  def show
    @movie = Movie.find(params[:id])
    @sum = 0
    count= 0
    @movie.reviews.each do |m|
      @sum += m.score
      count += 1
    end
    @avg = (@sum/count.to_f).round(2)
  end
  
  def review
    
    Review.create(
      comment: params[:comment],
      score: params[:score],
      movie_id: params[:id]
      )
    
    redirect_to :back
  end
end
