require 'sinatra'

feature "/add-bookmark" do
  scenario "adds a bookmark" do
    visit "/add-bookmark"
    fill_in 'url', with: 'thisisatest.com'
    click_on 'Submit'
    expect(page).to have_content('thisisatest.com')
  end
end

