class Movie < ApplicationRecord
  belongs_to :studio
  has_many :roles
  has_many :actors, through: :roles

  def actors_by_age
    actors.order(age: :asc)
  end
end
