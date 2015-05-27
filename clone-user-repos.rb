#!/usr/bin/ruby
require 'github_api'

unless user = ARGV[0]
    abort "Please specify the name of the user whose repositories you wish to clone."
end

github = Github.new auto_pagination: true
github.repos.list user: user do |repo|
    clone_url = repo[:clone_url]
    puts "Cloning #{clone_url}"
    `git clone #{clone_url} --recursive`
end
