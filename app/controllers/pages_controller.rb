class PagesController < ApplicationController
	def index # this is public method called index so it can be callable as action
	 @posts = Post.limit(5)
	end
end
