require 'open-uri'
require 'open_uri_redirections'
require 'nokogiri'

namespace :scrape do

task :sample_title => :environment do

url ='http://matome.naver.jp/tech'
charset = nil

opt = {}
opt['User-Agent'] = 'Opera/9.80 (Windows NT 5.1; U; ja) Presto/2.7.62 Version/11.01 '

 html = open(url, :allow_redirections => :all) do |f|
 	charset = f.charset 
 f.read
 end

doc = Nokogiri::HTML.parse(html,nil,'utf-8')

doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
  # タイトルの取得
  puts node.css('h3').inner_text
end
# doc.css('h3.entrylist-contents-title').each do |content|
#  title = content.inner_text
#  feed = Feed.new(
#  title: title
#  )
#  feed.save
#  end
end
end

# URLにアクセスするためのライブラリの読み込み
# require 'open-uri'
# require 'kconv'//文字コード変換。文字化け対策
# require 'nokogiri'

# namespace :scrape do

#   desc 'NaverまとめのTechページからタイトルを取得'
#   task :naver_title => :environment do
#     # スクレイピング先のURL
#     url = 'http://matome.naver.jp/tech'

#     charset = nil
#     html = open(url) do |f|
#       charset = f.charset # 文字種別を取得
#       f.read # htmlを読み込んで変数htmlに渡す
#     end

#     # htmlをパース(解析)してオブジェクトを作成
#     doc = Nokogiri::HTML.parse(html, nil, charset)

#     doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
#       # タイトルの取得
#       puts node.css('h3').inner_text
#     end
#   end

# end