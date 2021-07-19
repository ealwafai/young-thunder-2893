class RolesController < ApplicationController

  def create
    movie = Movie.find(params[:movie_id])
    Role.create(movie_id: movie.id, actor_id: params[:actor_id])
    redirect_to "/movies/#{movie.id}"
  end

end
