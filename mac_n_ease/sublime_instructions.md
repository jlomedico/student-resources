# Sublime Text Tips
[Complete Sublime Text Shortcuts](https://scotch.io/bar-talk/sublime-text-keyboard-shortcuts)

## Reindent

- Select some text, then Edit -> Line -> Reindent
- Use [this](http://sweetme.at/2013/10/04/how-to-automatically-reindent-code-with-sublime-text/) to define a shortcut key for the `reindent` command.

## Whitespace

- In the lower right, you can change the indent
  - Always use 2 spaces.
- To make this change for all `*.rb` (or any other) kind of file
  - Sublime Text 2 -> Preferences -> Settings - More -> Syntax Specific - User
```json
{
    "tab_size": 2,
    "translate_tabs_to_spaces": true
}
```

## Multi-select

- line
  - Command+Click
- word
  - Command+D

## Toggle select

- all: Command+A
- double click
- expand selection
  - Unit: Command+Shift+Space
  - Line: Command+L
  - Block: Command+Shift+J

## Toggle Indent

select lines, then
- tab or Command+]
- shift+tab or Command+[x

## Toggle Comment Block
Command+/

## Layouts
View -> Layout

## Go-to-line
Ctrl+g
Good for error messages.

## Global Find&Replace
Command+Shift+F (escape to exit)

## Advanced Plugins
https://packagecontrol.io/
