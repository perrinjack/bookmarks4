# frozen_string_literal: true

require 'sinatra'

feature '/add-bookmark' do
  scenario 'adds a bookmark' do
    visit '/add-bookmark'
    fill_in 'url', with: 'thisisatest.com'
    fill_in 'title', with: 'test'
    click_on 'Submit'
    expect(page).to have_content('test')
  end
end

feature 'deletes a bookmark' do
  scenario 'deletes an existing bookmark' do 

    Bookmark.create('www.google.com', 'Google' )
    visit('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.com') 

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google', href: 'http//www.google.com') 
  end
end
