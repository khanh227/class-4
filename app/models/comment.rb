class Comment < ApplicationRecord
=begin
  - Each comment belongs to one article.
  - One article can have many comments.
=end
  belongs_to :article
end
