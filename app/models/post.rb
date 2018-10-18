class Post < ApplicationRecord
	belong_to :user
	belong_to :category
end

class User < ApplicationRecord
	has_many :posts, dependent: :destroy
end

class Category < ApplicationRecord
	has_many :posts
end

