Intro to CSS


Default CSS
```
box-sizing:border-box;
Default CSS
```

Writing A Media Query
/*Style for iPad - Portrait*/

```
@media only screen and (max-device-width: 768px) {
```

```
display:flex;
```

CSS Flexbox
```
flex-direction: row;
flex-direction: column;
```

CSS Flexbox
```
justify-content: flex-start;
justify-content: flex-end;
```

CSS Flexbox
```
justify-content: center;
justify-content: space-between;
justify-content: space around;
CSS Flexbox - Child Properties
order: <integer>;
```

Example:
```
.box1 {
order: 2;
}
```

```
CSS Flexbox
flex-grow:<number>;
.box1 {
flex-grow: 1;
}
.box2 {
flex-grow: 2;
}
.box3 {
flex-grow: 1;
}
```

Holy Grail
```
<header>This is my header</header>
 <div id="main">
    <section>This is some text inside a section</section>
   <nav>This is some text in a nav</nav>
    <aside>This is some aside text</aside>
</div>
<footer>This is my footer</footer>
```


