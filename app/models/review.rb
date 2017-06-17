class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_presence_of :content
end
