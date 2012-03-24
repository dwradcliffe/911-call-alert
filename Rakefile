require 'rubygems'
require 'bundler/setup'
require "nokogiri"
require 'open-uri'
require 'active_support'
require 'active_support/core_ext/numeric'
require 'active_support/core_ext/time/calculations'
require 'active_support/core_ext/time/acts_like'
require './call'

desc "Check for 911 calls nearby"
task :check do
  
  doc = Nokogiri::XML(open('http://www2.indystar.com/images/graphics/hold/local/indy911/calls_H.xml'))
  calls = []
  doc.xpath('//markers/marker').each do |call|
    calls << Call.parse(call)
  end
  
  calls.each do |call|
    puts call if call.since?(20.minutes.ago)
  end
  
end