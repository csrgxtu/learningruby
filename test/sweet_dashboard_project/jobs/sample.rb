#!/usr/bin/env ruby
# encoding: utf-8
require 'unirest'
require 'json'

# current_valuation = 0
# current_karma = 0

SCHEDULER.every '2s' do
  userUrl = "http://dev.yuedu.io:21010/beautilfulreading/user/count"
  libUrl = "http://dev.yuedu.io:21010/beautilfulreading/library/count"
  userResponse = Unirest.get userUrl, auth:{:user=>"loser", :password=>"england"}, headers:{ "Accept" => "application/json" }
  libResponse = Unirest.get libUrl, auth:{:user=>"loser", :password=>"england"}, headers:{ "Accept" => "application/json" }
  # print(userResponse.body['data'], libResponse.body['data'])
  # response = Unirest.get "http://serverip:port/gps"
  # last_valuation = current_valuation
  # last_karma     = current_karma
  # current_valuation = rand(100)
  # current_karma     = rand(200000)

  # send_event('valuation', { current: current_valuation, last: last_valuation })
  # send_event('karma', { current: current_karma, last: last_karma })
  send_event('synergy',   { value: rand(100) })
  # send_event('welcome', { text: rand(100).to_s })
  send_event('bookkindsnum', { text: userResponse.body['data'] + rand(10)})
  send_event('onlineusers', { text: libResponse.body['data'] + rand(50)})
end
