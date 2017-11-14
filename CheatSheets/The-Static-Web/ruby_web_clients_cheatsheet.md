Ruby Web Clients


```shell
gem install httparty nokogiri
```

Client-Server Model
API
Facebook’s APIs:
GitHub API
GUI:
```shell
https://github.com/eddroid
```
API:
```shell
https://api.github.com/users/eddroid
```
HTTParty
```ruby
require 'httparty'

response = HTTParty.get('https://api.github.com/users/eddroid')

puts response.body, response.code, response.message, response.headers.inspect
```
```ruby
Response Headers
puts response.class
```ruby


puts response.headers.class
```
```ruby
Response Headers
puts response.headers.inspect

p response.headers
```
```ruby
Response Headers
{"server"=>["GitHub.com"], "date"=>["Mon, 29 Jun 2015 20:16:34 GMT"], "content-type"=>["application/json; charset=utf-8"], "transfer-encoding"=>["chunked"], "connection"=>["close"], "status"=>["200 OK"], "x-ratelimit-limit"=>["60"], "x-ratelimit-remaining"=>["47"], "x-ratelimit-reset"=>["1435610052"], "cache-control"=>["public, max-age=60, s-maxage=60"], "last-modified"=>["Sat, 06 Jun 2015 14:15:45 GMT"], "etag"=>["W/\"720cbc386598fff39c55d543865061f6\""], ...
Content-Type
puts response.headers["content-type"]

puts response.body.class


puts response.body
```
```ruby
require 'json'
body = JSON.parse response.body

puts body.class
```


```ruby
puts body
puts "My GitHub id is #{body['id']}"
puts "My name is #{body['name']}"
```

POST
```ruby
http://requestb.in/
POST
data = {first_name: 'Ed', username: 'Edbot'}

response = HTTParty.post('http://requestb.in/17f6lqj1', { body: data })

puts response.body
```

POST
PUT
```ruby
data = {first_name: 'Ed', username: 'Edbot'}

response = HTTParty.put('http://requestb.in/17f6lqj1', { body: data })

puts response.body
```

```ruby
PUT
JSON
body = {first_name: 'Ed', username: 'Edbot'}
headers = {'Content-Type' => 'application/json'}

response = HTTParty.post('http://requestb.in/17f6lqj1', { body: JSON.dump(body), headers: headers})
```
```ruby
JSON
Web as API

require "httparty"

url = "http://finance.yahoo.com/q?s=AAPL"

response = HTTParty.get url

puts response.body
Web as API
puts response.headers['content-type']
```
```ruby
Nokogiri
require 'nokogiri'

dom = Nokogiri::HTML(response.body)
puts dom.class
```
```ruby

XPath
XPath
dom.xpath("/")

dom.xpath("//*")
```

Chrome Dev Tools
```
<span class="time_rtq_ticker">
  <span id="yfs_l84_aapl">
    593.55
  </span>
</span>
XPath
dom.xpath("//*").size
=> 889

dom.xpath("//span").size
=> 94
XPath
<span class="time_rtq_ticker">
  <span id="yfs_l84_aapl">
    593.55
  </span>
</span>
````


XPath
```
dom.xpath("//span[@id='yfs_l84_aapl']").size
=> 1

dom.xpath("//span[@id='yfs_l84_aapl']").class

XPath
dom.xpath("//span[@id='yfs_l84_aapl']").first

```

Nokogiri
content()
  Returns the content for this Node


Web Scraping
my_span = dom.xpath("//span[@id='yfs_l84_aapl']").first

puts my_span.content
=> 593.22
API vs. Scraping
```