require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Twittercounter::Twitter do

  context "search information about a twitter username" do
    use_vcr_cassette "twitter_username_zigotto"

    let(:user) do
      Twittercounter::Twitter.user("zigotto")
    end

    it { user.id.should == 18770991 }
  end

  context "when use a invalid twitter username" do
    use_vcr_cassette "invalid_twitter_username"
    it { expect { Twittercounter::Twitter.user("123invalid456ID")}.to raise_error(/404 Not Found/) }
    it { expect { Twittercounter::Twitter.user }.to raise_error }
  end

end
