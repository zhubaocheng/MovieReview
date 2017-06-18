class Movie < ApplicationRecord
  #validates :title, :description, presence: true
  belongs_to :user
  has_many :reviews
  validates_presence_of :title, :description
  has_many :movie_relationships
  has_many :members, through: :movie_relationships, source: :user
end
