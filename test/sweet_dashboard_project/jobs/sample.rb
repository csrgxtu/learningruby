#!/usr/bin/env ruby
# encoding: utf-8
require 'unirest'
require 'json'

SCHEDULER.every '3s' do
  dates = Array.new(8)
  now = Time.new

  dates[0] = now.year.to_s + '-' + now.month.to_s + '-' + now.day.to_s
  tmpdate = now - 86400
  for i in 1 .. 7
    dates[i] = tmpdate.year.to_s + '-' + tmpdate.month.to_s + '-' + tmpdate.day.to_s
    tmpdate = tmpdate - 86400
  end
  # puts dates



  books = Array.new(8)
  users = Array.new(8)
  reviews = Array.new(8)
  thumbups = Array.new(8)
  booklists = Array.new(8)
  url = "https://api_rio.beautifulreading.com/beautilfulreading/admin/statistics/main"
  for i in 0 .. 7
    newUrl = url + '?date=' + dates[i]
    response = Unirest.get newUrl, auth:{:user=>"loser", :password=>"england"}, headers:{ "Accept" => "application/json" }
    books[i] = response.body['data']['library_count']
    users[i] = response.body['data']['online_count']
    reviews[i] = response.body['data']['comment_count']
    thumbups[i] = response.body['data']['favour_count']
    booklists[i] = response.body['data']['floor_count']
  end

  # response = Unirest.get url, auth:{:user=>"loser", :password=>"england"}, headers:{ "Accept" => "application/json" }
  # puts(response.body['data'])
  # puts books

  send_event('books', { mytext: books[0], day1: books[7], day2: books[6], day3: books[5], day4: books[4], day5: books[3], day6: books[2], day7: books[1]})
  send_event('users', { mytext: users[0], day1: users[7], day2: users[6], day3: users[5], day4: users[4], day5: users[3], day6: users[2], day7: users[1]})
  send_event('reviews', { mytext: reviews[0], day1: reviews[7], day2: reviews[6], day3: reviews[5], day4: reviews[4], day5: reviews[3], day6: reviews[2], day7: reviews[1]})
  send_event('thumbups', { mytext: thumbups[0], day1: thumbups[7], day2: thumbups[6], day3: thumbups[5], day4: thumbups[4], day5: thumbups[3], day6: thumbups[2], day7: thumbups[1]})
  send_event('booklists', { mytext: booklists[0], day1: booklists[7], day2: booklists[6], day3: booklists[5], day4: booklists[4], day5: booklists[3], day6: booklists[2], day7: booklists[1]})
end
