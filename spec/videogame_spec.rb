require('spec_helper')

describe(Videogame) do

  describe("#game") do
    it "adds a videogame to the list" do
    test_profile = Profile.create(:username => "pat", :password => "password")
    game = Videogame.create(:game_name => "hello")
    game.save()
    expect(game.game_name).to(eq("Hello"))
    end
  end
end
