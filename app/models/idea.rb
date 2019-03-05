class Idea < ApplicationRecord
	acts_as_votable
	has_many :idea_tags, dependent: :destroy
	has_many :tags, through: :idea_tags
	accepts_nested_attributes_for :tags

	def tag_attributes=(tag_attributes)
		tag_attributes.values.each do |tag_attribute|
			tag = Tag.find_or_create_by(tag_attributes)
			self.tags << tag
		end
	end
end
