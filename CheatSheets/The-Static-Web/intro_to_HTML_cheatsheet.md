Intro to HTML


The HTML5 Specification
```bash
http://www.w3.org/TR/html5/

http://validator.w3.org/
```


```
Boilerplate

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>My Document</title>
  </head>
  <body>
    [Most of your code goes here]
  </body>
</html>
```
Doctype
HTML4<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
```
HTML5
<!DOCTYPE HTML>
Charset
HTML4
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

HTML5
<meta charset="UTF-8">

Title
<title>My Document</title>
Body
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>My Document</title>
  </head>
  <body>
    [Most of your code goes here]
  </body>
</html>
```


HTML Syntax
```
<a href="http://www.wyncode.co">Wyncode</a>

HTML Comments
<!-- This is a comment -->
Character Escapes
Buenos D&#237;as Wyncode!

Buenos D&#x000ED;as Wyncode!

Buenos D&iacute;as Wyncode!


Do I need HTML Entities?
&lt;Night&gt; &amp; &lt;Day&gt;

<Night> & <Day>

<img>
<img src="profile.jpg" alt="Profile Pic" />


The alt attribute is “required”.
```

```
<a>
I'm with
<a href="https://www.wyncode.co">
  Wyncode.
</a>
<link>
<link rel="stylesheet" type="text/css" href="style.css">
<meta>
<meta name="viewport" content="width=device-width, initial-scale=1">

<input>
<input type="text" name="lastname">
Buttons
<input type="button" value="Submit" />

<button type="button">Submit</button>

<input type="submit" value="Submit" />
```
```
Generic Containers
<div> a logical division of the page, like a banner, navigation bar, sidebar, or footer.
<span> individual words and phrases (often called inline elements) within paragraphs

<div>, <span>
<div id="main">
  <p><span>Content</span> goes here</p>
</div>

```
HTML5 Semantic Elements


HTML nesting
When elements contain other elements, each element must be properly nested, that is, fully contained within its parent.

```
<div><p><a href="#">Link</p></a>
IECCs
Getting IE8 to understand HTML5:
<!--[if lt IE 9]>
  <script src="//html5shiv.googlecode.com/
svn/trunk/html5.js"></script>
<![endif]-->

```

Accessibility Guidelines
http://www.w3.org/TR/WAI-WEBCONTENT/full-checklist.html

Exploring & Debugging
View Source
Chrome Developer Tools
```
http://codepen.io/
```
