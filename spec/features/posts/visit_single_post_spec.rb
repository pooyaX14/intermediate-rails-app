require 'rails_helper'

RSpec.feature "Visit single post", :type => :feature do
	let(:user) { create(:user) }
	let(:postsss) { create(:post) }

	scenario "User goes to a single page from the home page", js: true do
		postsss
		visit root_path
		page.find(".single-post-card").click
		expect(page).to have_selector('body .modal')
		page.find('.interested a').click
		expect(page).to have_selector('#single-post-content p', text: postsss.content)
	end

end