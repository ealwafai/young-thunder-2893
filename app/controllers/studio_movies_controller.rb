class StudioMoviesController < ApplicationController
  def index
    @studio = Studio.find(params[:studio_id])
    @movies = @studio.movies
  end
end
