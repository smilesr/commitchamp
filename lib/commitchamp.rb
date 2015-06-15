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
      ENV['OAUTH_TOKEN']
      #   token = ENV['OAUTH_TOKEN']
      # else
      #   token = get_auth_token
      # end
      @github = Github.new
    end

    # def get_auth_token
    #   puts "Please enter your personal access token for Github:"
    #     #    /^[0-9a-f]{40}$/
    # end


  def show_repos
    @all_repos = Reposit.all
    # binding.pry
    puts "****** Current Repos in the Database ******"
    @all_repos.each_with_index do |r,i|
     puts "#{i + 1} - #{r.reposit_name}"
     puts ""
    end
  end

  def introduction
    puts "Would you like contribution statistics for
      (1) a repository currently in the database above, or
      (2) a new repository"
    response = gets.chomp
    until response =~ /^[12]$/
      puts "Please try again."
      response = gets.chomp
    end
    response.to_i
  end

# enter name of repo if from db
  def name_of_repo
    puts "What is the name of the repo from the database that you would like statistics for:"
    repo_name = gets.chomp
  end


# enter name of org and repo if needs to be fetched
  def name_of_org
    puts "What is the name of the organization that the repo is in?"
    owner_name = gets.chomp
  end

# query the table
  def query_table(repo)
    # chosen_repo = Reposit.select(:reposit_name).where(reposit_name: repo)
    displayed_repo = Reposit.find_by(reposit_name: repo) 
    repo_users = displayed_repo.users.all

    contribs = displayed_repo.contributions.order('additions + deletions DESC')
    puts "FOR THE #{repo.upcase} REPOSITORY:"
    puts "USER         ADDITIONS           DELETIONS             CHANGES"
    contribs.each do |contrib|
      # users_name = User.contributions.where(contrib.user_id = user_id)

      puts "#{contrib.user.user_name}           #{contrib.additions}            #{contrib.deletions}             #{contrib.additions + contrib.deletions}"
    end
  end

  def table_contributors(all_contributor_info, repo_name)
     #binding.pry
     # User.find_or_create_by(user_name: user.id)
     #user = User.find_or_create_by(user_name: all_contributor_info[0]["author"]["login"])
     repo_object = Reposit.find_or_create_by(reposit_name: repo_name)
      binding.pry
     all_contributor_info.each do |each_record|   
      lines_added = each_record['weeks'].map { |x| x['a'] }.sum
      lines_deleted = each_record['weeks'].map{ |x| x['d'] }.sum
      commits_made = each_record['weeks'].map { |x| x['c'] }.sum
      # binding.pry
      users_name = repo_object.users.find_or_create_by(user_name: each_record["author"]["login"])
       binding.pry     
      repo_object.contributions.find_or_create_by(user_id: users_name.id,
                                              additions: lines_added,
                                              deletions: lines_deleted,
                                              contribs: commits_made,
                                              reposit_id: repo_object.id)
      
      end# binding.pry
  end


  def run
    response = 0
    show_repos
    response = introduction
    if response == 1
      repo_name = name_of_repo
      query_table(repo_name)
    elsif response == 2
      owner_name = name_of_org
      repo_name = name_of_repo
      all_contributor_info = @github.get_contributors(owner_name, repo_name)
      table_contributors(all_contributor_info, repo_name)
    end
    query_table(repo_name)
  end
 end
  binding.pry
end

