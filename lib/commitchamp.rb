$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'pry'
require 'json'

require 'commitchamp/version'
require 'commitchamp/init_db'
require 'commitchamp/github'
require 'commitchamp/models'

module Commitchamp
  class App
    def initialize
      if ENV['OAUTH_TOKEN']
        token = ENV['OAUTH_TOKEN']
      else
        token = get_auth_token
      end
      @github = Github.new
    end

    def get_auth_token
      puts "Please enter your personal access token for Github:"
        #    /^[0-9a-f]{40}$/
    end


  def show_repos
    all_repos = Commitchamp::Reposit.all
    puts "****** Current Repos in the Database ******"
    all_repos.each_with_index do |r,i|
     puts "#{i + 1} - #{r.reposit_name}"
     puts ""
    end
  end

  def introduction
    puts "Would you like contribution statistics for
      (1) a repository currently in the database above, or
      (2) a new repository"
    response = gets.chomp
     show_repos
    until response =~ /^[12]$/
      puts "Please try again."
      response = gets.chomp
    end
    response.to_i
  end

# enter name of repo if from db
  def name_of_repo
    puts "What is the name of the repo from the database that you would like statistics for:"
      @repo_name = gets.chomp
  end


# enter name of org and repo if needs to be fetched
  def name_of_org
    puts "What is the name of the organization that the repo is in?"
    @org_name = gets.chomp
     # until response_org =~ /^\w*$/
     #  puts "Please try again."
     #  response_org = gets.chomp
    # end
  end

# query the table
  def query_table
    puts "nothing yet"
    #display_repos = Commitchamp::Reposit.select(:reposit_name).order(:additions + :deletions + :contribs)
  end

# get contributors from selected repo
  def pull_contributors#(@owner_name, @repo_name)
    contributors = @github.get_contributors(@org_name, @repo_name)
    contributors.each do |x|
        table_contributor(x)
    end
  end

  def table_contributor(contributor)
     @user = User.find_or_create_by(user_name: contributor["author"]["login"])
     lines_added = contributor['weeks'].map { |x| x['a'] }.sum
     lines_deleted = contributor['weeks'].map{ |x| x['d'] }.sum
     commits_made = contributor['weeks'].map { |x| x['c'] }.sum
     repo = Reposit.find_or_create_by(reposit_name: @repo_name)
     contrib = Contribution.find_or_create_by(user_id: @user.id,
                                              additions: lines_added,
                                              deletions: lines_deleted,
                                              contribs: commits_made,
                                              repo_id: repo.id)
     binding.pry
  end


  def run
    response = 0
    show_repos
    response = introduction
    if response == 1
      name_of_repo
    elsif response == 2
      owner_name = name_of_org
      repo_name = name_of_repo
      pull_contributors#(owner_name, repo_name)
    end
    query_table
  end
 end
  binding.pry
end

# app = Commitchamp::App.new
# binding.pry
