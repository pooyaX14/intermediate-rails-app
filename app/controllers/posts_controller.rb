require 'pry'
class PostsController < ApplicationController
	def show
# This @post instance is being used inside app/views/posts/show.html.erb
		# binding.pry
		@post = Post.find(params[:id])
		logger.debug "Showing post: #{@post.to_json} " 
	end
	def hobby
		@postssssss = posts_for_branch(params[:action])
		# binding.pry
		#logger.debug "Showing postssssss: #{@postssssss.to_json} " 
	end
	def study
		posts_for_branch(params[:action])
	end
	def team
		posts_for_branch(params[:action])
	end

	private

	def get_posts
	  # Post.limit(30)
	  branch = params[:action]
	  search = params[:search]
	  category = params[:category]

	  if category.blank? && search.blank?
	  	posts = Post.by_branch(branch).all
	  elsif category.blank? && search.present?
	  	posts = Post.by_branch(branch).search(search)
	  elsif category.present? && search.blank?
	  	posts = Post.by_category(branch, category)
	  elsif category.present? && search.present?
	  	posts = Post.by_category(branch, category).search(search)
	  else
	  end	
	end

	def posts_for_branch(branch)
		@categories = Category.where(branch: branch)
		puts @categories
		@posts = get_posts.paginate(page: params[:page])
		respond_to do |format|
			format.html
			format.js { render partial: 'posts/posts_pagination_page'}
		end
	end

end
