class Movie < ApplicationRecord
  #validates :title, :description, presence: true
  validates_presence_of :title, :description
end
