class FeedsController < ApplicationController

	def index
		require 'open-uri'
		require 'open_uri_redirections'
		require 'nokogiri'

		# namespace :scrape do

		# task :sample_title => :environment do

		url ='http://matome.naver.jp/tech'
		charset = nil

		# opt = {}
		# opt['User-Agent'] = 'Opera/9.80 (Windows NT 5.1; U; ja) Presto/2.7.62 Version/11.01 '

		html = open(url, :allow_redirections => :safe) do |f|
			charset = f.charset 
		f.read
		end

		@feeds = []

		doc = Nokogiri::HTML.parse(html,nil,'utf-8')

		doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
		  # タイトルの取得
		  # puts node.css('h3').inner_text

		@feeds << node.css('h3').inner_text
		  
		end
		# doc.css('h3.entrylist-contents-title').each do |content|
		#  title = content.inner_text
		#  feed = Feed.new(
		#  title: title
		#  )
		#  feed.save
		#  end
		# end
		# end
	end
end
