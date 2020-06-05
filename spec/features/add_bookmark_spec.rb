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

  feature 'updates a bookmark' do
    scenario 'updates an existing bookmark' do
    visit('/bookmarks')
    Bookmark.create('www.premierleague.com', 'Prem')
    first('.bookmark').click_button 'Update'
    fill_in('title', with: 'Playboy')
    fill_in('url', with: 'Playboy.com')
    click_button('Update')
    expect(page).to have_link('Playboy', href: 'http://www.Playboy.com')
    end 
end
