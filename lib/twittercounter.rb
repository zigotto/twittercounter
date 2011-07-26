require "httparty"

module Twittercounter

  class Request
    include HTTParty
  end

  class Client

    attr_accessor :apikey, :twitter_id
    attr_accessor :version, :username, :url, :avatar, :followers_current, :date_updated, :follow_days, 
      :started_followers, :growth_since, :average_growth, :tomorrow, :next_month, :followers_yesterday, 
      :rank, :followers_2w_ago, :growth_since_2w, :average_growth_2w, :tomorrow_2w, :next_month_2w, :followersperdate, :last_update

    def initialize(options={})
      options = {:output => "json", :count => "14"}.merge!(options)

      if options.has_key?(:twitter_username)
        twitter_id = Request.get("http://api.twitter.com/users/show.json", :query => {:screen_name => options.delete(:twitter_username)})["id"]
        options.merge!(:twitter_id => twitter_id)
      end

      self.apikey = options[:apikey]
      self.twitter_id = options[:twitter_id]

      response = Request.get("http://api.twittercounter.com", :query => options)
      if response.code == 200
        self.version             = response["version"]
        self.username            = response["username"]
        self.url                 = response["url"]
        self.avatar              = response["avatar"]
        self.followers_current   = response["followers_current"]
        self.date_updated        = response["date_updated"]
        self.follow_days         = response["follow_days"]
        self.started_followers   = response["started_followers"]
        self.growth_since        = response["growth_since"]
        self.average_growth      = response["average_growth"]
        self.tomorrow            = response["tomorrow"]
        self.next_month          = response["next_month"]
        self.followers_yesterday = response["followers_yesterday"]
        self.rank                = response["rank"]
        self.followers_2w_ago    = response["followers_2w_ago"]
        self.growth_since_2w     = response["growth_since_2w"]
        self.average_growth_2w   = response["average_growth_2w"]
        self.tomorrow_2w         = response["tomorrow_2w"]
        self.next_month_2w       = response["next_month_2w"]
        self.followersperdate    = response["followersperdate"]
        self.last_update         = response["last_update"]
      else
        raise "#{response.code} #{response.message}"
      end

    end

  end

end
