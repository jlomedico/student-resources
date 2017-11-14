# Intro to Web Clients and Postman
## Time
  1hr

## Summary

In this breakout session, you will learn how to use Postman as a tool to communicate with APIs.

## Objectives

Students will learn how to:
- Recognize instructions for using an API
- Retrieve information in different formats from an API using Postman 
- Make a GET and a POST request using Postman
- Generate copyable code snippet from Postman to use outside of Postman and make a request

## Prequisites

- Intro to Internet

## Required Resources

- [Postman app](https://www.getpostman.com/)


#### Intro
- What is Postman?
  Postman is a tool that helps you build, test, and document APIs faster. In other words, it's an easier way to interact with API's using HTTP requests.

#### Installation
You can download Postman [free](https://www.getpostman.com/)


# How do we use it?


* ###### Interface

   The Postman interface is divided into two areas. The sidebar on the left and the request builder on the right. The request builder lets you create almost any kind of request quickly. The four parts of an HTTP request are the URL, method, headers, and the body. Postman gives you tools to work with each of these parts.



#### To create a GET request in Postman

 The URL is the first thing that you would be setting for a request. The URL input field stores URLs used previously and will show an auto complete drop down as you begin entering your URL. Clicking on the URL params button will open up the key-value editor for entering URL parameters.

 _You can individually add key/value pairs and Postman will combine everything together. If your URL already has parameters - for example, if you are pasting a URL from some other source, Postman will split the URL into pairs automatically._

Example:
Let's use the [USA Goverment job search API](http://search.digitalgov.gov/developer/jobs.html#using-the-api) to find a software developer job.
  According to the API documentation, the format for the request is:
    `https://api.usa.gov/jobs/search.json?parameters`
    So if we wanted to look for a software developer job, we do:
    `https://api.usa.gov/jobs/search.json?query=software+developer+jobs`
    Lets go ahead and paste that link in your favorite flavor of browser. You should get, more or less, something very easy to read, such as:

```txt
[{"id":"usajobs:433084000","position_title":"Sr. Business Process Software Engineer","organization_name":"House of 
Representatives","rate_interval_code":"PA","minimum":105170,"maximum":119011,"start_date":"2016-03-17","end_date":"2016-04-
25","locations":["Washington, DC"],"url":"https://www.usajobs.gov/GetJob/ViewDetails/433084000"},
{"id":"usajobs:432550800","position_title":"SUPERVISORY FORCE DEVELOPMENT SPECIALIST","organization_name":"U.S. Air Force - Agency 
Wide","rate_interval_code":"PA","minimum":78846,"maximum":96004,"start_date":"2016-03-11","end_date":"2016-03-24","locations":["El 
Segundo, CA"],"url":"https://www.usajobs.gov/GetJob/ViewDetails/432550800"}]
```


This is a very good looking JSON response (JavaScript Object Notation). This is how computers talk to each other. However we can make it easier on the human eyes by using Postman.
    Let's open the Postman App and paste the link in the URL input field. If you head over the "Body" tab and hit "Pretty", you should see formatted JSON, which is easier to read.

```JSON
[
  {
    "id": "usajobs:433084000",
    "position_title": "Sr. Business Process Software Engineer",
    "organization_name": "House of Representatives",
    "rate_interval_code": "PA",
    "minimum": 105170,
    "maximum": 119011,
    "start_date": "2016-03-17",
    "end_date": "2016-04-25",
    "locations": [
      "Washington, DC"
    ],
    "url": "https://www.usajobs.gov/GetJob/ViewDetails/433084000"
  },
  {
    "id": "usajobs:432550800",
    "position_title": "SUPERVISORY FORCE DEVELOPMENT SPECIALIST",
    "organization_name": "U.S. Air Force - Agency Wide",
    "rate_interval_code": "PA",
    "minimum": 78846,
    "maximum": 96004,
    "start_date": "2016-03-11",
    "end_date": "2016-03-24",
    "locations": [
      "El Segundo, CA"
    ],
    "url": "https://www.usajobs.gov/GetJob/ViewDetails/432550800"
  }
]
```
That is a bit easier to read. We can see how the levels are nested. If we look at the Postman interface. Next to the URL there is a Button named 'Params'. If we hit it you will see that you have a query field  which is your 'key' in Postman, contains the params of the search we were trying to perform. ('software+developer+jobs').

Let's try to add a tag. Let's  add a tag to specify searching within  federal government agencies.
`https://api.usa.gov/jobs/search.json?query=software+developer+jobs&tags=federal`

If we look at the Postman interface and hit  'Params' we will see that
now there is another key call tags. This is the procedure that we will follow to add parameters to our URL requests.

#### To create a cURL command in Postman

You can construct a request in Postman and convert it to cURL using the code snippet generator.
1. Create a request in the Postman builder
2. Click on the code icon.(`generate code`)
3. Choose cURL from the drop down.
4. BAM! There’s your cURL command! Now you can copy and paste it in the command line.

#### You can also revert the same process, from the command line to Postman.
 
 1. Click on the import tab on the top.
 2. Select the Raw Text option and paste your cURL command.
 3. Hit import and you will have the command in your Postman builder!

# All that is well, but let's say that we want to make that very same request in Ruby.

 1. Paste in the URL request`https://api.usa.gov/jobs/search.json?query=software+developer+jobs`
 2. Click 'Send'
 3. Click 'Code' on the right op corner under `Save` button
 4. You should see a "Generate Code Snippets" pop up. From the dropdown, select "Ruby.
 5. Voila! A Very nice block of Ruby code has been generated by Postman. Head over the command line, type "irb" and paste it there. Mine looks like:

 ```RUBY
require 'uri'
require 'net/http'

url = URI("https://api.usa.gov/jobs/search.json?query=software%20developer%20jobs")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["cache-control"] = 'no-cache'
request["postman-token"] = '5750e33d-5329-22a3-51e0-f46c7c680ecb'

response = http.request(request)
puts response.read_body
```

And you should see the response now. You may use this snippet of code in any part of a program where you need to parse a response from an API.

______

# To create a POST request in Postman
 
 You can construct a POST request in Postman as well. The HTTP POST request method is meant to transfer data to a server (and elicit a response). What data is returned depends on the implementation of the server. In POST requests, values are sent in the "body" of the request. With web-forms they are most likely sent with a media type of application/x-www-form-urlencoded or multipart/form-data. While constructing requests, you would be dealing with the request body editor a lot. Postman lets you send almost any kind of HTTP request.

1. Open the Postman App and paste the link `https://echo.getpostman.com/post` in the URL input field. This is Postman test endpoint that allows testing requests. There is a nice documentation [here](http://echo.getpostman.com/).
2. Select the method POST from the select control. The request body editor area will change. Now you have a 'body' enabled , so you can add a payload.
3. Right under it we can click 'Headers' and type in the key section  'Content-Type'. This specifies in the request what type of content we are sending in the post. We will be sending text, so in the value field we type 'text/plain'.
4. Select 'Body' and in that menu, select 'raw', then from the drop down 'Text/text/plain'.
5. Type any message you want to test in the text area.
6. Hit 'Send' and you should see the response. Mine looks like:

  `
  {
    "args": {},
    "data": "Hello API :)!",
    "files": {},
    "form": {},
    "headers": {
        "host": "echo.getpostman.com",
        "content-length": "13",
        "accept": "*/*",
        "accept-encoding": "gzip, deflate",
        "accept-language": "en-US,en;q=0.8,es;q=0.6",
        "cache-control": "no-cache",
        "content-type": "text/plain",
        "cookie": "getpostmanlogin=yes; postman.sid=6405610a732fd58fa01debc56ccf1544890b7f028e07cd93e440de8ad22ee1ac6e142d18539bee4b1870bee74f72a73d5b2f9907d8f6af263689cfca514ce5cf9578396fda6ceb25d4e22087745200a5631fe140138ec48667cc245e8bd2bdf754a418ca56b9daca7aaf8aafab9e57166b370827eb6a0550537dd6ba389ed048cf3df5b37ac682a01182c9740337f2f636ad81b47acb0932412d4f903c80986a6c089be5d0896ee8375b26b2afb3498c432a68c27eeefe89cd9b38a7d75375e9f24c3ec1a20b5a9ed5cb90e9c94028712385eae8c67427c3cd15bd6fd9b2f898e98afaa77ddd6e79806bad13cb; _ga=GA1.2.402214245.1458678487; _ga=GA1.3.402214245.1458678487; sails.sid=s%3AiUjdNR84ey1zDNbjYgRap3_FL47f6mNm.o8aYnE%2F0UpKEIWeT%2BbFdbbYq9RflemJKICTOwgz19Qo",
        "dnt": "1",
        "origin": "chrome-extension://aicmkgpgakddgnaphhhpliifpcfhicfo",
        "postman-token": "c4d90558-7160-5ce8-1076-92e51a29eab0",
        "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36",
        "x-forwarded-port": "443",
        "x-forwarded-proto": "https"
    },
    "json": null,
    "url": "https://echo.getpostman.com/post"
}
  `

If you head over the "Body" tab and hit "Pretty", you should see formatted JSON, which is easier to read.  The second key is `data`, and next to it, you will see the "Hello API :)!" message.
If we wanted the Ruby code that will do the same request, we can do as before. Select "Generate Code" and then select Ruby from the dropdown.


## Keep Going
- Try [testing requests with Postman](http://echo.getpostman.com/)
- Try to use the [Postman Blog](http://blog.getpostman.com/tutorials/) for more resources.
- Try [using interceptor to read and write cookies](https://www.getpostman.com/docs/interceptor_cookies)
