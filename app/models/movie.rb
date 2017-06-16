class Movie < ApplicationRecord
  #validates :title, :description, presence: true
  belongs_to :user
  validates_presence_of :title, :description
end
