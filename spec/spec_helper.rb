ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")

require("./lib/profile")
require("./lib/opinion")
require("./lib/videogame")

RSpec.configure do |config|
  config.after(:each) do
    Profile.all().each do |profile|
      profile.destroy()
    end
    Videogame.all().each do |videogame|
      videogame.destroy()
    end
    Opinion.all().each do |opnion|
      opnion.destroy()
    end
  end
end
