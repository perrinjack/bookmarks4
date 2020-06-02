require 'sinatra'

feature "/bookmarks page" do
  scenario "views bookmarks" do
    visit '/bookmarks'
    expect(page).to have_content("list of bookmarks")
  end
end