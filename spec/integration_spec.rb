require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('login', {:type => :feature}) do
  it('gets to index properly') do
    visit('/')
    expect(page).to have_content('create login.')
  end
  it('creates a login') do
    visit('/')
    fill_in("username", :with => 'bigben')
    fill_in("password", :with => '12345')
    click_button('make account')
    expect(page).to have_content('YOUR PROFILE HAS BEEN SAVED IN THE DATABASE')
  end
end
