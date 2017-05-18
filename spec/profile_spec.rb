require('spec_helper')


describe(Profile) do

  describe("validate encrypted password can login") do
    it "has a readable password after encryption" do
    u = Profile.create(:username => "pat", :password => "password")
    expect(u.password()).to(eq("password"))
    end
  end
  describe("#save") do
  it("lets you save profiles to the database") do
    profile = Profile.new({:id => nil, :username => "Gamer2000", :password => "ao;sefjaoe"})
    profile.save()
    expect(Profile.all()).to(eq([profile]))
    end
  end
  describe(".find") do
   it("returns a profile by its ID") do
     test_profile = Profile.new({:id => nil, :username => "superduper", :password => "alkdsfjl;"})
     test_profile.save()
     test_profile2 = Profile.new({:id => nil, :username => "epicgamer", :password => "alkdsfjl;"})
     test_profile2.save()
     expect(Profile.find(test_profile2.id())).to(eq(test_profile2))
   end
 end
 describe("#profiles") do
  it("returns an array of profiles that have been added as friends") do
    test_profile = Profile.new({:id => nil, :username => "Feed the animals drive", :password => "ajdf;aljkf"})
    test_profile.save()
    test_profile1 = Profile.new({:id =>nil, :username => "Billy Jean", :password => "ajdf;aljkf"})
    test_profile1.save()
    test_profile2 = Profile.new({:id => nil, :username => "Michael Jackson", :password => "ajdf;aljkf"})
    test_profile2.save()
    test_profile.profiles.push(test_profile1)
    expect(test_profile.profiles()).to(eq([test_profile1]))
    end
  end
end
