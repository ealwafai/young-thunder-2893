require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it {should have_many(:roles)}
    it {should have_many(:actors).through(:roles)}
  end

  describe 'instance methods' do
    describe '#actors_by_age' do
      it 'returns movie actors from youngest to oldest' do
        universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
        raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
        actor_1 = Actor.create!(name: 'Harrison Ford', age: 79)
        actor_2 = Actor.create!(name: 'John Davies', age: 77)
        actor_3 = Actor.create!(name: 'Alfred Molina', age: 68)
        raiders.roles.create!(actor: actor_1)
        raiders.roles.create!(actor: actor_2)
        raiders.roles.create!(actor: actor_3)

        expect(raiders.actors_by_age).to eq([actor_3, actor_2, actor_1])
      end
    end
  end
end
