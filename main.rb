require 'net/http'
require 'json'
require 'uri'

uri = URI('https://www.boredapi.com/api/activity')

res = Net::HTTP.get(uri)

p res