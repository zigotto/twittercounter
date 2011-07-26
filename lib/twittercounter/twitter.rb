module Twittercounter

  class Twitter

    attr_accessor :id

    def initialize(response)
      self.id = response["id"]
    end

    def self.user(username)
      response = Request.get("http://api.twitter.com/users/show.json", :query => {:screen_name => username})
      if response.code == 200
        Twitter.new(response)
      else
        raise "#{response.code} #{response.message}"
      end
    end

  end

end
