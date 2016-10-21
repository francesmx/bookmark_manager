require 'spec_helper'

feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Link.create(url: 'http://www.makersacademy.co.uk/', title: 'Makers Academy')
    visit '/links'

    # this is a *temporary* sanity check - to make sure we
    # can load the page :)
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end

feature 'Viewing links by tag' do
  before(:each) do
    visit '/links/new'
    fill_in('link_name', with: 'The Stephen Gregory, OBE')
    fill_in('link_url', with: 'http://www.stephengregory.co.uk/')
    fill_in 'tags',  with: 'actor'
    click_button('Submit')
  end
  scenario 'Filter links by tag' do
    visit '/tags/actor'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content('The Stephen Gregory, OBE')
      expect(page).not_to have_content('Makers Academy')
    end
  end
end
