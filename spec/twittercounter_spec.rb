require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Twittercounter do

  context "provides information about a twitter id" do

    use_vcr_cassette "twitter_id_15160529"

    let(:info) do
      Twittercounter::Client.new(
        :apikey => "e9335031a759f251ee9b4e2e6634e1c5",
        :twitter_id => "15160529"
      )
    end

    it { info.apikey.should == "e9335031a759f251ee9b4e2e6634e1c5" }
    it { info.twitter_id.should == "15160529" }

    it { info.version.should == "1.1" }
    it { info.username.should == "TheCounter" }
    it { info.url.should == "http://twittercounter.com/" }
    it { info.avatar.should == "http://a1.twimg.com/profile_images/481277925/twc_logo_normal.png" }
    it { info.followers_current.should == 10305 }
    it { info.date_updated.should == Date.new(2011, 07, 25) }
    it { info.follow_days.should == "663" }
    it { info.started_followers.should == "3617" }
    it { info.growth_since.should == 6688 }
    it { info.average_growth.should == "10" }
    it { info.tomorrow.should == "10315" }
    it { info.next_month.should == "10605" }
    it { info.followers_yesterday.should == 10299 }
    it { info.rank.should == "38148" }
    it { info.followers_2w_ago.should == 10139 }
    it { info.growth_since_2w.should == 166 }
    it { info.average_growth_2w.should == "12" }
    it { info.tomorrow_2w.should == "10317" }
    it { info.next_month_2w.should == "10665" }
    it { info.followersperdate.should == {
      "date2011-07-25"=>10305,
      "date2011-07-24"=>10299,
      "date2011-07-23"=>10308,
      "date2011-07-22"=>10300,
      "date2011-07-21"=>10284,
      "date2011-07-20"=>10268,
      "date2011-07-19"=>10252,
      "date2011-07-18"=>10236,
      "date2011-07-17"=>10220,
      "date2011-07-16"=>10216,
      "date2011-07-15"=>10199,
      "date2011-07-14"=>10175,
      "date2011-07-13"=>10160,
      "date2011-07-12"=>10154
      }
    }
    it { info.last_update.should == 1311650890 }

  end

end
