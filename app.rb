
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/profile')
require('./lib/videogame')
require('./lib/opinion')
require('bcrypt')

require('pry')
require("pg")

get("/") do
  erb(:index)
end

get('/login') do
  erb(:login)
end
get("/profile") do
    @description = @user_profile.description()
  erb(:profile)
end
get("/friends_list/:profile_id/user/:user_id") do
  user_id = params.fetch("user_id").to_i
  @user = Profile.find(user_id)
  @list = @user.profiles().first().username()
  @profile = @user
  erb(:friends_list)
end

get("/all_users/:profile_id/user/:user_id") do
  user_id = params.fetch("user_id").to_i
  @user_profile = Profile.find(user_id)
  @profiles = Profile.all()
  @description = @user_profile.description()
  erb(:all_users)
end

get("/profile/:profile_id/user/:user_id") do
  friend_id = params.fetch("profile_id").to_i
  user_id = params.fetch("user_id").to_i
  @user_id = Profile.find(user_id)
  @profile = Profile.find(friend_id)
  @user = @user_id
  erb(:profile)
end
get("/profile/:profile_id/user_profile/:user_profile_id") do

  friend_id = params.fetch("profile_id").to_i
  user_id = params.fetch("user_profile_id").to_i
  @user_id = Profile.find(user_id)
  @profile = Profile.find(friend_id)
  @user = @user_id
  erb(:profile)
end
post("/add_friend") do
  friend_id = params.fetch("profile_id").to_i
  user_id = params.fetch("user_id").to_i
  @user = Profile.find(user_id)
  @friend = Profile.find(friend_id)

  @user.profiles.push(@friend)

   @list = @user.profiles().first().username()
  @profile = @user
  @user_id = @profile
  erb(:profile)
end

post("/profile") do
  username = params.fetch("username")
  password = params.fetch("password")

  Profile.create(:username => username, :password => password)
  erb(:success)
end

post('/login') do
  username = params.fetch("username")
  password = params.fetch("password")
  @profile = Profile.find_by(:username => username, :password => password)

  if @profile != nil
    @profile = Profile.find_by(:username => username, :password => password)
    @user_id = @profile
    @user = @profile
    erb(:profile)
  else
    erb(:error)
  end
end

get("/add_videogame/:profile_id/user/:user_id") do
  user_id = params.fetch("user_id").to_i
  @profile = Profile.find(user_id)
  erb(:add_videogame_form)
end

post("/add_videogame/:id") do
  game_name = params.fetch("game_name")
  Videogame.create(:game_name => game_name)
  id = params.fetch("id").to_i
  @profile = Profile.find(id)
  @videogames = Videogame.all()

  erb(:videogame_list)
end

get('/videogame_list/:profile_id/user/:user_id') do
  @videogames = Videogame.all()
  user_id = params.fetch("user_id").to_i
  @profile = Profile.find(user_id)

  erb(:videogame_list)
end
get('/profile/:id') do
  id = params.fetch("id").to_i
  @profile = Profile.find(id)
  opinion = @profile.opinions()


    @profile.opinions.each() do |opinion|
      name=Videogame.find(opinion.videogame_id().to_i).game_name()
      opinion = opinion.post

  end
  @user_id = @profile
  @user = @profile
  erb(:profile)
end

get('/profile/:profile_id/videogames/:videogame_id')do
  profile_id = params.fetch("profile_id").to_i
  videogame_id = params.fetch("videogame_id").to_i
  @videogame = Videogame.find(videogame_id)
  @profile = Profile.find(profile_id)

  @opinions = Opinion.find_by(:videogame_id => videogame_id)

  erb(:videogame)
end


post("/opinion/post/:profile_id/:videogame_id") do
  profile_id = params.fetch("profile_id").to_i
  videogame_id = params.fetch("videogame_id").to_i
  post = params.fetch("post")
  @opinion = Opinion.create(:profile_id => profile_id, :videogame_id => videogame_id, :post => post, :tag => nil)
  @profile = Profile.find(profile_id)
  @username = @profile.username()
  @user_id = @profile
  @user = @profile
  erb(:profile)
end
