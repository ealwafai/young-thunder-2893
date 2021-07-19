require 'rails_helper'

RSpec.describe 'The Studio Index Page' do
#   Story 1
# Studio Index
#
# As a user,
# When I visit the studio index page
# I see a each studio's name and location
# And underneath each studio, I see the titles of all of its movies.
  it 'lists studios name and location' do
    universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    paramount = Studio.create(name: 'Paramount Studios', location: 'Hollywood')
    columbia = Studio.create(name: 'Columbia Pictures', location: 'Hollywood')

    visit '/studios'

    expect(page).to have_content(universal.name)
    expect(page).to have_content(paramount.name)
    expect(page).to have_content(columbia.name)
  end

  it 'displays underneath each studio, the titles of all of its movies' do
    universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    paramount = Studio.create(name: 'Paramount Studios', location: 'Hollywood')
    columbia = Studio.create(name: 'Columbia Pictures', location: 'Hollywood')
    raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    shrek = universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
    titanic = paramount.movies.create(title: 'Titanic', creation_year: 1997, genre: 'Romance')
    grease = paramount.movies.create(title: 'Grease', creation_year: 1978, genre: 'Romantic Comedy')
    godfather = paramount.movies.create(title: 'The Godfather', creation_year: 1972, genre: 'Action')
    ghostbusters = columbia.movies.create(title: 'Ghostbusters', creation_year: 1984, genre: 'Adventure')

    visit '/studios'

    expect(page).to have_content(raiders.title)
    expect(page).to have_content(shrek.title)
    expect(page).to have_content(titanic.title)
    expect(page).to have_content(grease.title)
    expect(page).to have_content(godfather.title)
    expect(page).to have_content(ghostbusters.title)
  end
end
