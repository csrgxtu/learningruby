#!/usr/bin/env ruby
# encoding: utf-8
require 'unirest'
require 'json'

# current_valuation = 0
# current_karma = 0

SCHEDULER.every '2s' do
  # userUrl = "http://dev.yuedu.io:21010/beautilfulreading/user/count"
  # libUrl = "http://dev.yuedu.io:21010/beautilfulreading/library/count"
  # userResponse = Unirest.get userUrl, auth:{:user=>"loser", :password=>"england"}, headers:{ "Accept" => "application/json" }
  # libResponse = Unirest.get libUrl, auth:{:user=>"loser", :password=>"england"}, headers:{ "Accept" => "application/json" }
  url = "https://api_rio.beautifulreading.com/beautilfulreading/admin/statistics/main"
  response = Unirest.get url, auth:{:user=>"loser", :password=>"england"}, headers:{ "Accept" => "application/json" }
  puts(response.body['data'])
  # print(userResponse.body['data'], libResponse.body['data'])
  # response = Unirest.get "http://serverip:port/gps"
  # last_valuation = current_valuation
  # last_karma     = current_karma
  # current_valuation = rand(100)
  # current_karma     = rand(200000)

  # send_event('valuation', { current: current_valuation, last: last_valuation })
  # send_event('karma', { current: current_karma, last: last_karma })
  # send_event('synergy',   { value: rand(100) })
  # send_event('welcome', { text: rand(100).to_s })
  send_event('books', { text: response.body['data']['library_count']})
  send_event('users', { text: response.body['data']['online_count']})
  send_event('booklists', { text: rand(50)})
  send_event('reviews', { text: response.body['data']['comment_count']})
  send_event('thumbups', { text: response.body['data']['favour_count']})
  
end
