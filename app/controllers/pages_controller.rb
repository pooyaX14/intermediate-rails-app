class PagesController < ApplicationController
	def index # this is public method called index so it can be callable as action
	 # @posts = Post.limit(5)
	 	@hobby_posts = Post.by_branch('hobby').limit(8)
	 	@study_posts = Post.by_branch('study').limit(8)
    @team_posts = Post.by_branch('team').limit(8)
	end
end
