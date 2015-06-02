require 'httparty'

module Commitchamp
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def get_contributors(org_name, repo_title)
      self.class.get("/repos/#{org_name}/#{repo_title}/stats/contributors")
    end

  end
end
