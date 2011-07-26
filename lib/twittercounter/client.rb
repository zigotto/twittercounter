module Twittercounter

  class Client

    attr_accessor :apikey, :twitter_id
    attr_accessor :version, :username, :url, :avatar, :followers_current, :date_updated, :follow_days, 
      :started_followers, :growth_since, :average_growth, :tomorrow, :next_month, :followers_yesterday, 
      :rank, :followers_2w_ago, :growth_since_2w, :average_growth_2w, :tomorrow_2w, :next_month_2w, :followersperdate, :last_update

    def initialize(options={})
      options = {:output => "json", :count => "14"}.merge!(options)
      raise "apikey is required" if options[:apikey].blank?
      raise "twitter_id or twitter_username is required" if options[:twitter_id].blank? && options[:twitter_username].blank?

      if options.has_key?(:twitter_username)
        twitter_id = Request.get("http://api.twitter.com/users/show.json", :query => {:screen_name => options.delete(:twitter_username)})["id"]
        options.merge!(:twitter_id => twitter_id)
      end

      self.apikey = options[:apikey]
      self.twitter_id = options[:twitter_id]

      response = Request.get("http://api.twittercounter.com", :query => options)
      if response.code == 200
        response.each {|name, value| send("#{name}=", value)}
      else
        raise "#{response.code} #{response.message}"
      end

    end

  end

end
