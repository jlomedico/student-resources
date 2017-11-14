# Atom Resources

[Complete Atom Shortcuts](http://sweetme.at/2014/03/10/atom-editor-cheat-sheet/#atom_code_nav)  
[Best of Atom](https://scotch.io/bar-talk/best-of-atom-features-plugins-acting-like-sublime-text)  
[12 Favorite Atom Tips](https://www.sitepoint.com/12-favorite-atom-tips-and-shortcuts-to-improve-your-workflow/)  
[Atom Flight Manual](http://flight-manual.atom.io/)

## Auto Indent

- Select some text, then `Edit`->`Lines`->`Auto Indent`
- Atom has no default shortcut for this. You can create one by selecting the menu option `Atom`->`Keymap` and pasting the following into your `keymap.cson`.

On Mac this uses `command`+`option`+`p`:
```cson
'atom-text-editor':
  'cmd-alt-p': 'editor:auto-indent'
```

On Ubuntu this uses `ctrl`+`alt`+`i`:
```cson
'atom-text-editor':
  'ctrl-alt-i': 'editor:auto-indent'
```

You can use whatever key combination you wish (as long as it's not being used for anything else). Save the file and restart Atom when you're done.

## Whitespace

- To change whitespace default for all `*.rb` (or any other) kind of file
  - Atom -> Preferences -> Settings -> Editor -> Tab Length

## Select

- All: Command + A
- Entire Line
  - Command + L
  - Double Click
- Entire Word
  - Command + D
  - Triple Click
- Rest of Line: Command + Shift + Right/Left  Arrow
- Rest of Document: Command + Shift + Up/Down Arrow


## Toggle Indent

- Select lines, then:
  - Left: Tab or Command + ]
  - Right: Shift + Tab or Command + [

## Toggle Comment Block

- Command + /

## Layouts

- Split, change focus, or close panes: View -> Panes
- Resize panes
  - Larger: Command + Option + =
  - Smaller: Command + Option + -

## Go-to-line

- Ctrl + G or click on bottom-left line and column indicator
  - Good for error messages.

## Global Find&Replace

- Command + Shift + F (escape to exit)

## Advanced Packages

- https://atom.io/packages
