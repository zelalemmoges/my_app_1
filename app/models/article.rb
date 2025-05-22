class Article < ApplicationRecord
#   class Article < ApplicationRecord
#   validates :title, presence: true, uniqueness: true
#   validates :description, presence: true
#   validate :title_cannot_be_too_generic

#   def title_cannot_be_too_generic
#     if title.present? && title.downcase.strip.in?(["title", "untitled", "article"])
#       errors.add(:title, "is too generic")
#     end
#   end
# end

validates :title, :description, presence:true

end
