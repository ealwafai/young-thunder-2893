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

#   Story 3
# Add an Actor to a Movie
#
# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the name submitted is not an existing actor)

  it 'user does not see any actors listed that are not part of the movie' do
    universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = Actor.create!(name: 'Harrison Ford', age: 79)
    actor_2 = Actor.create!(name: 'John Davies', age: 77)
    actor_3 = Actor.create!(name: 'Alfred Molina', age: 68)
    actor_4 = Actor.create!(name: 'Arnold Schwarzenegger', age: 73)
    raiders.roles.create!(actor: actor_1)
    raiders.roles.create!(actor: actor_2)
    raiders.roles.create!(actor: actor_3)

    visit "/movies/#{raiders.id}"

    expect(page).to_not have_content(actor_4)
  end

  it 'user sees a form to add an actor to this movie' do
    universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_4 = Actor.create!(name: 'Arnold Schwarzenegger', age: 73)


    visit "/movies/#{raiders.id}"

    expect(page).to have_content('Add an actor for this movie:')
    fill_in :name, with: actor_4.name
    click_button 'Submit'
    expect(current_path).to eq("/movies/#{raiders.id}")
    expect(page).to have_content(actor_4.name)
  end
  it 'user fill in the form with the name of an actor that exists in the database and clicks submit'
  it 'user sees see the actor name is now listed after submitting'
end
