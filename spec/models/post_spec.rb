require 'rails_helper'

RSpec.describe Post, type: :model do
  # We use the described_class method to get the current context’s class. Which is 
  # basically the same as writing Post in this case. Then we use reflect_on_association 
  # method to check that it returns a correct association.

  context 'Associations' do
  	it 'belongs_to user' do
  		association = described_class.reflect_on_association(:user).macro
  		expect(association).to eq :belongs_to
  	end	

  	it 'belongs_to category' do
  		association = described_class.reflect_on_association(:category).macro
  		expect(association).to eq :belongs_to
  	end
  end

  context 'Scopes' do
    it 'default_scope orders by descending created_at' do
      first_post = create(:post)
      second_post = create(:post)
      expect(Post.all).to eq [second_post, first_post]
    end

    it 'by_category scope gets posts by particular category' do
      # We're creating category factory which is written inside 
      # spec/factories/categories.rb file.
      category = create(:category) 
      create(:post, category_id: category.id)
      # create_list = create_list(:post, 10)

      # we're fetching post by_category scope query 
      #puts category.name
      #puts "*" * 100
      posts = Post.by_category(category.branch, category.name)

      #puts category.inspect
      # <Category id: 3, name: "name3", branch: "branch3", created_at: "2018-11-08 11:15:38", updated_at: "2018-11-08 11:15:38">

      #puts posts.inspect
      # <ActiveRecord::Relation [#<Post id: 3, title: "poopoopoopoopoo",
      # content: "purnimapurnima", category_id: 3, user_id: 3, 
      # created_at: "2018-11-08 11:15:38", updated_at: "2018-11-08 11:15:38">]>

      #puts posts.length # 1

      # puts create_list.inspect
      expect(posts.count).to eq 1
      expect(posts[0].category.name).to eq category.name
    end

    it 'by_branch scope gets posts by particular branch' do
      category = create(:category)
      create(:post, category_id: category.id)
      create_list(:post, 10)
      posts = Post.by_branch(category.branch)

      expect(posts.count).to eq 1
      expect(posts[0].category.branch).to eq category.branch
    end


    it 'search finds a matching post' do
      post = create(:post, title: 'awesome title', content: 'great content ' * 5)
      puts post.inspect
      # create_list = create_list(:post, 10, title: ('a'..'c' * 2).to_a.shuffle.join)
      # puts create_list.inspect
      # puts "*" * 100
      
      # The Post.search('great')[0] will return Post with great content/title
      # puts Post.search('great')[0].id ==> 15

      expect(Post.search('awesome').count).to eq 1
      expect(Post.search('awesome')[0].id).to eq post.id
      expect(Post.search('great').count).to eq 1
      expect(Post.search('great')[0].id).to eq post.id
    end
  end

end
