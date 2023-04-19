require_relative '../lib/Openai.rb'

describe "the login_openai method" do
    it "should return response, and response is not nil" do
      expect(login_openai(url,headers)).not_to be_nil
    end
end