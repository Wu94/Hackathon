require 'news-api'

n = News.new("api_key")

p n.get_sources(country: 'us', language: 'en')

p n.get_everything(q: "apple", from: "2018-01-05&to=2018-01-05", sortBy: "popularity")
p n.get_top_headlines(sources: "bbc-news")