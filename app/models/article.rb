=begin
Article class inherits from ApplicationRecord.
ApplicationRecord inherits from ActiveRecord::Base

class Article < ApplicationRecord
end
=end

=begin
class Article < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5}
end
=end

=begin
	- Each comment belongs to one article.
	- One article can have many comments.	
	
	dependent: :destroy
	If you delete an article, its associated comments will also need to be deleted, 
	otherwise they would simply occupy space in the database. 
=end
class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
end