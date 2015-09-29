require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the artist input path') do
  it('lists input artists', {:type => :feature}) do
    visit('/')
    fill_in('artist', :with => 'Prince')
    click_button('Submit')
    click_link('Back')
    fill_in('artist', :with => 'Kraftwerk')
    click_button('Submit')
    click_link('Back')
    expect(page).to(have_content('Kraftwerk Prince'))
  end
end

describe('the artist path') do
  before() do
    Artist.delete()
  end
  
  it('lists the albums of an artist', {:type => :feature}) do
    visit('/')
    fill_in('artist', :with => 'Prince')
    click_button('Submit')
    click_link('Back')
    click_link('Prince')
    fill_in('album', :with => 'Purple Rain')
    fill_in('tracks', :with => "Let\'s Go Crazy, Take Me With You, I Would Die 4 U, Purple Rain")
    click_link('Back')
    expect(page).to(have_content("Purple Rain Let\'s Go Crazy I Would Die 4 U Purple Rain"))
  end
end