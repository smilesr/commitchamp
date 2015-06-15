require 'pry'
require 'json'
# x = Array.new

# # a = temp1[0][0]["weeks"]["a"]
# x[0] = 
#      [
#       {
#         "author" =>
#           { "login" => "octocat",
#             "id" => 1
#           },
#         "total" => 135,
#         "weeks" => [
#           {
#             "w" => "1367",
#             "a" => 6898,
#             "d" => 77
#           }
#          ]
#         }
#      ]       
# x[1] =
#      [
#       {
#         "author" =>
#           { "login" => "bob",
#             "id" => 2
#           },
#         "total" => 100,
#         "weeks" => [
#           {
#             "w" => "2110",
#             "a" => 4500,
#             "d" => 70
#           }
#          ]
#         }  
#       ]
      
# # puts x[0]
# # puts "*******"
# # puts x[1]
# addition = []
# deletion = []
# x.each do |a|
#   a.map do |w|
#     w.map do |b|
#       # v.each do |b|
#        b.map do |k,v|
#         b["weeks"].map do |m|
#           m.map do |o,p|
#             addition.push(m["a"])
#             deletion.push(m["d"])
#         end
#       end
#     # end
#     end
#   end
# end
# def give_number
#   y = 4
# end

# def run
#   give_number
#   if give_number == 5
#     puts "yes"
#     else
#     puts "no"
#   end
# end

# run
# binding.pry



#   binding.pry
# end
# binding.pry


# end# addition = []
# deletion = []

# +++++++++++
# temp1 = []
# x.each do |item|
#   temp1.push(item)
# end
# binding.pry
#++++++ WORKED
# a=[]
# b=[]
# temp1.each do |xx|
#   a.push(xx[0]["weeks"][0]["a"])
#   b.push(xx[0]["weeks"][0]["d"])
# end
# puts a
# puts b

# +++++++++
# x.each do |b|
#   x1 = b[0]
#   x2 = b[]
# temp2 ={}
# temp1.each do |x|
#   temp2 = x
#   temp2.each do |k,v|
#     temp3 = temp2.keys
#   end

# end
# x.each do |y|
  # y.each do |z|
     # binding.pry
    # addition.push(z['weeks']["a"])
    # binding.pry
    # deletion.push(z['weeks']["a"])
# binding.pry
  # end
# end

# json['data']['alerts'].each do |alerts|
#   # do whatever you want with these...
#   alerts['dataPoint']
#   alerts['startOn']
#   alerts['ackedOn']

# {
#   "status": 200,
#   "data": {
#     "total": 251,
#     "alerts": [
#       {
#         "dataPoint": "x",
#         "ackedBy": "x",
#         "dataSourceInstance": "x",
#         "dataSource": "x",
#         "host": "x",
#         "endOn": 0,
#         "ackedOn": 1385085190,
#         "dataSourceInstanceId": 588384,
#         "hostId": 935,
#         "type": "alert",
#         "dataSourceId": 694,
#         "ackedOnLocal": "2013-11-21 17:53:10 PST",
#         "id": 6170384,
#         "startOn": 1385084917,
#         "thresholds": "!= 1 1 1",
#         "endOnLocal": "",
#         "level": "error",
#         "ackComment": "x",
#         "value": "No Data",
#         "hostDataSourceId": 211986,
#         "acked": true,
#         "hostGroups": [{
#           "alertEnable": true,
#           "createdOn": 1362084592,
#           "id": 21,
#           "parentId": 78,
#           "description": "",
#           "appliesTo": "",
#           "name": "2600hz",
#           "fullPath": "x"
#         }],
#         "startOnLocal": "2013-11-21 17:48:37 PST"
#       }

# arr = [[{"aa" => "11", "bb" => "22"},{"cc" => "33", "dd" => "44"}]]

# binding.pry
x = []
x[0] = JSON.parse('[
  {
    "author": {
      "login": "octocat",
      "id": 1,
      "avatar_url": "https://github.com/images/error/octocat_happy.gif",
      "gravatar_id": "",
      "url": "https://api.github.com/users/octocat",
      "html_url": "https://github.com/octocat",
      "followers_url": "https://api.github.com/users/octocat/followers",
      "following_url": "https://api.github.com/users/octocat/following{/other_user}",
      "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
      "organizations_url": "https://api.github.com/users/octocat/orgs",
      "repos_url": "https://api.github.com/users/octocat/repos",
      "events_url": "https://api.github.com/users/octocat/events{/privacy}",
      "received_events_url": "https://api.github.com/users/octocat/received_events",
      "type": "User",
      "site_admin": false
    },
    "total": 135,
    "weeks": [
      {
        "w": "1367712000",
        "a": 6898,
        "d": 77,
        "c": 10
      }
    ]
  }
]')
x[1] = JSON.parse('[
  {
    "author": {
      "login": "ellie",
      "id": 1,
      "avatar_url": "https://github.com/images/error/octocat_happy.gif",
      "gravatar_id": "",
      "url": "https://api.github.com/users/octocat",
      "html_url": "https://github.com/octocat",
      "followers_url": "https://api.github.com/users/octocat/followers",
      "following_url": "https://api.github.com/users/octocat/following{/other_user}",
      "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
      "organizations_url": "https://api.github.com/users/octocat/orgs",
      "repos_url": "https://api.github.com/users/octocat/repos",
      "events_url": "https://api.github.com/users/octocat/events{/privacy}",
      "received_events_url": "https://api.github.com/users/octocat/received_events",
      "type": "User",
      "site_admin": false
    },
    "total": 135,
    "weeks": [
      {
        "w": "1367712000",
        "a": 6898,
        "d": 100,
        "c": 50
      }
    ]
  }
]')
# JSON.parse(value)
temp1 = []
x.each do |item|
  temp1.push(item)
end
temp1.each do |y|
  # yy = JSON.parse(y)
  z=y[0]["weeks"][0]["a"]
end
