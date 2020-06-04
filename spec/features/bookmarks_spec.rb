require 'sinatra'

feature "/bookmarks page" do
  scenario "views bookmarks" do
    add_test_data
    visit '/bookmarks'
    expect(page).to have_content("Google")
    expect(page).to have_content("Makers")
    expect(page).to have_content("Destroy")
  end
end

