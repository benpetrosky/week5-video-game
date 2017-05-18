require('spec_helper')

describe(Opinion) do

  describe("#post") do
    it "posts from users are appended into the respective videogame" do
    test_profile = Profile.create(:username => "pat", :password => "password")
    videogame_test = Videogame.create(:game_name => "hello")
    opinion = Opinion.create(:post => "nice", :videogame_id => videogame_test.id(), :profile_id => test_profile.id())
    opinion.save()
    expect(opinion.post).to(eq("nice"))
    end
  end
end
