require "rails_helper"

RSpec.feature "Editing an article" do
	before do
		@article = Article.create(title: "My article title", body: "my article body")
	end

	scenario "A user deletes an article" do
		visit "/"

		click_link @article.title
		click_link "Delete Article"

		expect(page).to have_content("Deleted successfully!")
	end	
end


