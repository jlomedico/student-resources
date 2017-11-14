require 'httparty'

method = ARGV[0]
url = ARGV[1]

# raise ArgumentError if (method != "GET" || url.nil?)

if (method != "GET" || url.nil?)
  puts "Usage: ruby curl.rb [HTTP_METHOD] [URL]"
elsif (method == "GET" && url)
  response = HTTParty.get(url)

  puts "\n=== HEADERS ===\n"
  p response.headers
  puts "\n=== BODY ===\n"
  puts response.body
end
