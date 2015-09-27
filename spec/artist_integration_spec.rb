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