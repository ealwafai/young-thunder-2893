require 'rails_helper'

RSpec.describe 'The Movie Show Page' do
#   Story 2
# Movie Show
#
# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors

  it 'displays movie title, creation year, and genre' do
    universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')

    visit "/movies/#{raiders.id}"

    expect(page).to have_content(raiders.title)
    expect(page).to have_content(raiders.creation_year)
    expect(page).to have_content(raiders.genre)
  end

  it 'lists of all the movie actors from youngest to oldest' do
    universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = Actor.create!(name: 'Harrison Ford', age: 79)
    actor_2 = Actor.create!(name: 'John Davies', age: 77)
    actor_3 = Actor.create!(name: 'Alfred Molina', age: 68)
    raiders.roles.create!(actor: actor_1)
    raiders.roles.create!(actor: actor_2)
    raiders.roles.create!(actor: actor_3)

    visit "/movies/#{raiders.id}"

    expect(actor_3.name).to appear_before(actor_2.name)
    expect(actor_2.name).to appear_before(actor_1.name)
  end
end
