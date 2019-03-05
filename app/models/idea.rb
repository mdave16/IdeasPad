class Idea < ApplicationRecord
	acts_as_votable
	has_and_belongs_to_many :tags
end
