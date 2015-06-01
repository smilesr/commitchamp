require 'httparty'

module Commitchamp
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def get_contributors(owner_name, repo_title)
      self.class.get("/repos/#{owner_name}/#{repo_title}/states/contributors")
    end

  end
end
