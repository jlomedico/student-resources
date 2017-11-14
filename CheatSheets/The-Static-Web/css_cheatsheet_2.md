# CSS Layouts & Positioning

## Setup
If you haven't already, clone the [student resources](https://github.com/wyncode/student-resources) repo.
```sh
git clone https://github.com/wyncode/student-resources.git
cd student-resources/css2_lesson
```

If you've already cloned the repo, then `cd` into it, `pull` any updates, then `cd` into the `css2_lesson` subdir.
```sh
cd student-resources
git pull
cd css2_lesson
```

Once you're in the correct folder, open the HTML file in a browser
```sh
open index.html
```

### Ems & Rems

Try this sample code in `style.css`:

```css
p {
  padding-left: 5em;
  border: 1px solid gray;
}

.one {
  font-size: 0.5em;￼￼
}
.two {
  font-size: 1em;
}
.three {
  font-size: 2em;
}
```



```css
p {
  padding-left: 5rem;
}
```


Let's delete everything in `style.css` and replace it with this.

```css
.one {
  font-size: 0.5em;
  width: 50%;
}

.two {
  font-size: 0.5em;
  width: 50%;
}

#paragraph-two {
  border: 2px solid red;
}
```

Both paragraphs appear to take up 50% of the width of the screen, but it's a little off.

A more reliable way to guarantee a component takes up 50% of the page is the `vw` (viewport width) unit.
Change the CSS for `.one` to look like this:

```css
.one {
  font-size: 0.5em;
  width: 50vw;
}
```


To make this more noticeable, let's add a width to paragraph two.

```css
#paragraph-two {
  ...
  width: 600px;
}
```



## Display/Hiding Elements

Let's reset `style.css` again and replace it with this
```css
p {
  border: 1px solid gray;
}
```

Now let's make the first paragraph disappear by adding this:

```css
...

.one {
  display: none;
}
```

The `display: none;` property removes the element from the document display. It still exists in the HTML, but it leaves no trace on the rendered page.

Another way to make an element disappear is to change it's `visibility`.
Let's try that out by change the CSS for `.one` to look like this:

```css
.one {
  visibility: hidden;
}
```

Paragraph one disappears, but the space it would have occupied remains.

## Box Model

### Margins

Let's reset the `style.css` again.

```css
#paragraph-two {
  border: 2px solid red;
  width: 16em;
  height: 16em;
  background-color: lightgray;
}
```

We've put paragraph two into a box. Take a look at it.

Now add a `margin: 1em` to the style block:

```css
#paragraph-two {
  ...
  margin: 1em;
}
```

The margin property adds some space around the `div`. The area inside the `div` doesn’t shrink, but the total area taken up by the element increases.

The margin is always transparent; it doesn’t inherit the background color of the element.

The `margin` CSS property is a shorthand for "margin all around". You can also specify each margin separately. Each of these examples are equivalent.

```css
/* margin: [top] [right] [bottom] [left];  */
margin: 0em 10em 0em 10em;
```

```css
/* margin: [top&bottom] [right&left]; */
margin: 0em 10em;
```

```css
margin-top: 0em;
margin-right: 10em;
margin-bottom: 0em;
margin-left: 10em;
```

#### Margin Collapse

Let's turn paragraph three into a box as well. Add the following to the end of your stylesheet:

```css
#paragraph-three {
  border: 2px solid green;
  width: 16em;
  height: 16em;
  background-color: lightblue;
}
```


The appropriate way to horizontally center a block-level element is to let the browser automatically calculate the correct margins.

```css
#paragraph-two {
  ...
  margin: 0 auto;
}
#paragraph-three {
  ...
  margin: 0 auto;
}
```

When the `margin-left` and `margin-right` are set to `auto`, the browser will automatically keep the element centered. Think of an `auto` margin like a spring. If you add one spring on each side of an element, their combined force will keep the element centered.



### Padding

Now let’s try padding. Leave paragraph three as is, but add padding for paragraph-two

```css
#paragraph-two {
  ...
  padding: 2em;
}
```

The CSS `padding` property adds space around the text, but within the `div` border. As before, the `div` grows larger, but the text pushes away the edges.

Just like `margin`, `padding` is shorthand for “padding all around”. You can also specify each side individually.

```css
/* padding: [top] [right] [bottom] [left];  */
padding: 0em 10em 0em 10em;
```

```css
/* padding: [top&bottom] [right&left];  */
padding: 0em 10em;
```

```css
padding-top: 0em;
padding-right: 10em;
padding-bottom: 0em;
padding-left: 10em;
```

Unlike margin, padding does not “collapse”. If two elements are adjacent and padded, the space between them will be the _sum_ of their respective paddings. This effect tends to be easier to understand, so padding is more popular than margin for positioning between elements.

Let's add `padding: 1em;` to both boxes and remove the margin

```css
#paragraph-two {
  ...
  padding: 1em;
}
#paragraph-three {
  ...
  padding: 1em;
}
```

Each box maintains its own padding. `1em` of padding on the top and bottom of each box create a total of `2em`s of padding between each elements' contents.

### Border

You've already seen the `border` property used. It styles the border between the margin and the padding. The shorthand syntax for the border property is:

```css
/* border: style (required), color, width; */
border: solid #1a86a1 5px;
```

The additional fields in most CSS shorthands are optional. That means if they are left out, default values are used instead. Therefore this:

```css
border: solid;
```

will generate a solid border. The default color is black and the default width is 2px.

Unlike margin and padding, the border property order can be rearranged. In fact, the most commonly used syntax is actually:

```css
/* border: width, style (required), color; */
border: 5px solid red;
```

CSS is smart enough to tell the difference between a length value (`5px`), a border style (`solid`), and a border color (`red`), no matter what order they appear in. Just make sure a `border-style` appears somewhere in the list (because the default value is `border-style: none;`).

The `border` CSS shorthand can be expanded into lots of different sub-properties for different levels of control, but they're not very common.

You can specify each value separately.
```css
border-style: solid;
border-width: 5px;
border-color: red;
```

You can specify the top, bottom, left, and right values separately.
```css
border-top: 5px solid red;
```

And you can combine top/bottom/left/right with style/width/color.
```css
border-top-style: solid; /* border-top-width, border-top-color */
border-bottom-style: dashed; /* border-bottom-style, border-bottom-color */
border-left-style: dotted; /* border-left-style, border-left-color */
border-right-style: ridged; /* border-right-style, border-right-color */
```

So the `border` shorthand represents up to 12 different separate styles in one.

```css
#paragraph-two {
  border-top: 5px dashed red;
  ...
}
```

## Element Dimensions

The total size of an element (the actual height and width it consumes) is the sum of the sizes of its constituent parts:
* content: internal organs
* padding: fat
* border: skin
* margin: personal space



Here are some additional resources on how to use it:
* https://css-tricks.com/international-box-sizing-awareness-day/
* http://learnlayout.com/box-sizing.html

Note that this CSS3 style has not reached recommendation status. [Browser support is good](http://caniuse.com/#feat=css3-boxsizing), but there are issues and the spec may change.

Let's replace all of the css to look like this:

```css
#paragraph-two {
  border: 2px dashed blue;
  width: 600px;
  padding: 1em;
}

#paragraph-three {
  border: 2px dashed green;
  width: 600px;
  padding: 1em;
}
```

Take a quick look at the page.

Now let's add `box-sizing: border-box` to paragraph two.

Notice how it gets smaller. That's because the boxes weren't actually 600px wide before. They were 600px + 2px + 1em. Only after applying the `border-box` does the box actually shrink down to 600px.

For consistent sizing, it is a good practice to set all of your elements to have this type of sizing by default. This can be set at the top of your stylesheet (along with your other CSS resets) as follows:

```css
body {
  box-sizing: border-box;
}
```

You can override it later if necessary.

Now let's reset `style.css` again and move on.

## Float


Let's try an example:

```css
#paragraph-four {
  background: #1a86a1;
}

#floater {
  width: 10em;
  background: #31D3FD;
  float: left;
  margin: 5px;
}
```

The `#floater` `div` is within the `#paragraph-four` `div`. The `<p class="four">` is also within `#paragraph-four`. So `.four` and `#floater` are siblings. Nonetheless, the text within `.four` flows around the `#floater`.

Now change the `float` to `float: right` to see the change of it's position within the block of text.

### Floats Obey Their Parent's Dimensions

By adding some padding to `paragraph-four`:

```css
#paragraph-four {
  ...
  padding: 2em;
}
```

... we can see how the square’s padding wraps around `#floater`, pushing it away from the edge as if it were part of the text.

### Floats Can Have Dimensions Themselves

The floater can specify it’s own margin and padding.

By changing `#floater` to have  `margin: 1em;` we can see that property being applied only to the `#floater`, clearing some space around it within the paragraph block.

This also shows margin transparency. The container's background color is visible through the margin.

### Floated Elements Effect Siblings

Floated elements don't need to be contained within another element to effect them. Let's *delete all of the css for `# floater`* and set the fifth paragraph to `float: left;` instead.

```css
.five {
  width: 10em;
  background: #31D3FD;
  float: left;
  margin: 1em;
}
```

And set the sixth to `float: right;` ...

```css
.six {
  width: 10em;
  background: #31D3FD;
  float: right;
  margin: 1em;
}
```

Paragraphs 5 and 6 are siblings inside `<body>`, and yet the text in paragraphs 7-9 will still float around them.

### Float Overflow

A floated element tries to start itself close to where it is referenced in the HTML. But a float can end wherever it wants, even if that means overflowing its container.

Let's edit the size of paragraph `.five` so that the text overflows its container.

```css
.five {
  ...
  height: 30em;
}
```

The effect is jarring, as the text overflows the container and overlaps the bordering text.

To prevent a float from overflowing its container, you can use the infamous "clearfix hack".

```css
.five {
  ...
  overflow: auto;
  zoom: 1; /* IE6 */
}
```

Setting `overflow: auto;` (and `zoom: 1;` for IE6) prevents the float from overflowing it's container, either by strectching it, adding a scroll bar (`overflow: scroll;`) or clipping it (`overflow: hidden`). This works in most browsers but the world of "clearfixing" can be [treacherous](http://learnlayout.com/clearfix.html). There are many variations of this hack, none of them fully satisfying.

### Clearing Floats

Let's delete these last few lines...

```css
height: 30em;
overflow: auto;
zoom: 1; /* IE6 */
```

And let's go ahead and set the last paragraph (nine) like so:

```css
.nine {
  clear: left;
  background: #1a86a1;
  padding: 2em;
}
```


## Display

`div`s, by default, are _block level_ elements. They stretch left and right to take up a whole horizontal line of your document. `p` and `form` are also common block level elements. Add a border to any `<p>` element to confirm.

But this property of `div`s and `p`s can be changed by setting the CSS `display` property.

For example, `<li>` elements are also block-level by default, meaning every item in a list wants to take up 100% of the width of your page. To make a list display horizontally instead of vertically (such as within a `<nav>` container) we use `display:inline`.
Copy the following into `style.css`:

```css
li {
  display:inline;
}
```

Notice that the first word of the lists in our document are still indented. This is a default style for `<ul>` elements. Simply override it by resetting padding to 0.

```css
ul {
  padding: 0;
}
```

## Position

When it comes to laying elements out onto a page, perhaps the most powerful CSS style is `position`. Wrestling control of element positioning from the browser can be tough, but it’s the only way to have full control.

The default position value of most elements is `static`.  An element styled with `position: static;` is said to be not positioned.

### Relative Positioning
Relative positioning gives you the ability to move an item "relative" to its original position.

To see this in action lets modify the title of the page.

```css
.title {
  border: 3px solid red;
  position:relative;
}
```

We've added a border to the title, but nothing else has changed. That's because `position: relative;` doesn't do anything on it's own. It just unlocks the ability to use `top`, `right`, `bottom`, and `left`. to shove an element wherever you'd like.

```css
.title {
  ...
  top: 2em;
  left: 2em;
}
```


### Fixed Positioning

Fixed positioning allows you to place an element wherever you’d like relative to the viewport - the current portion of a web page visible through a browser window.

Let's set the bottom navigation links to be fixed.

```css
.bottom-links {
  background-color: white;
  width: 100%;
  position: fixed;
  bottom: 0;
}
```


Hovering an element over your page with `position: fixed;` may cause it to overlap other elements, hiding them. Whenever you hover elements this way, you typically have to add some extra whitespace to allow you to scroll those covered elements into view.

```css
body {
  margin-bottom: 3em;
}
```

### Absolute Positioning



Lets set paragraph four to have a position of relative and move it up a little.

```css
#paragraph-four {
  ...
  background: lightblue;
  position:relative;
  top: -5em;
}
```

Now lets position the `#floater` element to the top right of its parent and change its color so we can see it better.

```css
#floater {
  background-color: white;
  position: absolute;
  top: 1em;
  right: 1em;
}
```

`#floater` is positioned absolutely, but, in this example, that means it's position relative to `#paragraph-four`. It's in the top-right corner of it's parent.

Now comment out paragraph four's positioning:

```css
#paragraph-four {
  ...
  background: lightblue;
  /*position:relative;*/
  top: -5em;
}
```

Now the `#floater` element is positioned relative to the `body`. It's now located in the upper right corner of the entire page.

