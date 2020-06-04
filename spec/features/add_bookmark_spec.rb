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
