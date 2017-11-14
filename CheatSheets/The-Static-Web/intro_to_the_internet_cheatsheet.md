Intro to the Internet



What’s my ip address?

```bash
http://remoteip.me/
```
Localhost
There's no place like
127.0.0.1
DNS

```bash
nslookup google.com

```
```bash

telnet google.com 80

Escape character is '^]'.
```


```bash
TRACE, OPTIONS, CONNECT, PATCH
HTTP GET
curl -i -X GET google.com

curl -i google.com


HTTP Status Codes
curl -i google.com

```
```bash
curl -i www.google.com


http://httpcats.herokuapp.com


HTTP HEAD
curl -i -X HEAD www.google.com

curl -iX HEAD www.google.com

curl -X HEAD -i www.google.com
HTTP POST/PUT
curl -iX POST --data "" www.google.com

curl -iX PUT --data "" www.google.com

HTTP DELETE
curl -iX DELETE www.google.com
```
```bash
HTTP Methods
REST
http://yourdomain.com/things

GET = List all the things
PUT = Replace all the things
POST = Create a new thing
DELETE = Delete all the things
```
```bash
REST
http://yourdomain.com/things/thing17

GET: Get the 17th thing.
PUT: Update the 17th thing.
POST: Create the 17th thing.
DELETE: Delete the 17th thing.
URL
scheme://domain:port/path?query_string#fragment_id

http://ip-address:80/path?query_string#fragment_id

```
```bash
Cookies
Set-Cookie: PREF=ID=4f6a4c062bfcdd20:FF=0:TM=1398403479:LM=1398403479:S=BDWwfz1Y6jrs63aC; expires=Sun, 24-Apr-2016 05:24:39 GMT; path=/; domain=.google.com
Cookies
Cookies

```