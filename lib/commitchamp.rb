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
      @github = Github.new
    end

# ask user for token
  def user_pass
    if ENV['OAUTH_TOKEN'].nil?
      puts "What is your github token code?"
    end
  end
# show current repo db
  def show_table
    puts "TEST"
  end

# ask user for choice of current repo & new repo
  def introduction
    puts "What is your github username"
    @owner_name = gets.chomp

    puts "Would you like contribution statistics for
      (1) a repository currently in the database, or
      (2) a new repository"
    response = gets.chomp
    until response =~ /^[12]$/
      puts "Please try again."
      response = gets.chomp
    end
    response.to_i
  end

# bad input message

# enter name of repo if from db
  def name_of_repo
    puts "What is the name of the repo from the database that you would like statistics for:"
      repo_name = gets.chomp
    # until repo_name =~ /^\w*$/
    #   puts "Please try again."
    #   repo_name = gets.chomp
    # end
  end

# enter name of org and repo if needs to be fetched
  def name_of_org
    puts "What is the name of the organization that the repo is in?"
    response_org = gets.chomp
     # until response_org =~ /^\w*$/
     #  puts "Please try again."
     #  response_org = gets.chomp
    # end
  end
# query the table
  def query_table
  end

# get contributors from selected repo
  def pull_contributors(owner_name, repo_name)
    contributors = @github.get_contributors(owner_name, repo_name)
    contributors.each do |x|
      # x.each do |y|
        table_contributor(x["author"]["login"])
      # end
    end
  end
# temp1.each do |xx|
#   a.push(xx[0]["weeks"][0]["a"])
#   b.push(xx[0]["weeks"][0]["d"])
# end
# put contributors in db
  def table_contributor(contributor)
     # User.find_or_create_by(user_name: contributor('login'))
     User.find_or_create_by(user_name: contributor)
     #binding.pry
      # Reposit.find_or_create_by(reposit_name: @repo_name)
      # user.reposits.create(reposit_name: @repo_name)
      # user.reposits.contributions()
      # Contribution.find_or_create_by()
  end
#   a.push(xx[0]["weeks"][0]["a"])
#   b.push(xx[0]["weeks"][0]["d"])
# # sort data
#   def analyze_contributors
#   end

# run
  def run
    response = 0
    user_pass
    show_table
    response = introduction
    if response == 1
      puts "number 1"
      name_of_repo
    elsif response == 2
      puts "number 2"
      owner_name = name_of_org
      repo_name = name_of_repo
      pull_contributors(owner_name, repo_name)
    end
    query_table
    show_table
  end




  end
  binding.pry
end

# app = Commitchamp::App.new
# binding.pry
