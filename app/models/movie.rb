class Movie < ApplicationRecord
  #validates :title, :description, presence: true
  belongs_to :user
  has_many :reviews
  validates_presence_of :title, :description
end
