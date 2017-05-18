require('spec_helper')

RSpec.configure do |config|
end
describe(Profile) do

  describe("validate encrypted password can login") do
    it "has a readable password after encryption" do
    u = Profile.create(:username => "pat", :password => "password")
    expect(u.password()).to(eq("password"))
    end
  end
end
