# Sloppy Code


### Overview
Students will learn about tips and tricks to make coding even more pleasant and productive as well as the importance of following the best practices of the language they're using. They will also get examples of having proper indentation, spacing and other coding .

### Objectives
Students will be able to:
- know what a code smell is
- identify improper indentation and general bad practices
- customize editor to fit their style of coding

### Background
As you gain more experience as a developer you'll notice a _feeling_ you get when looking at code that tells you that the code can be cleaner and/or better. This is often referred to as a _code smell_. Along with a code smell you'll developer a certain way you like your enviornment to be setup. This includes custom packages and preferences for your editor. Here we will be going over how to approach making sure you're always doing your best to keep your code clean and tips to make you more productive as a developer.

___

### Editor preferences and plugins

You might have changed your editors theme by now to have different background and text color. You can also customize your editor preferences even further by changing things like the font-family, font-size, word wrap, among other things. Beyond that, you can find plugins that will make your coding life even more fun. Here we will be going over a few examples of things you can do.

- User preferences

If I'm using SublimeText as my editor, it comes predefined with preferences but they can be overwritten through user preferences. This is an example of what I've customized my preferences to be:

```ruby
{
    "bold_folder_labels": true,
    "caret_extra_bottom": 3,
    "caret_extra_top": 3,
    "caret_extra_width": 2,
    "caret_style": "phase",
    "color_scheme": "Packages/User/SublimeLinter/Solarized (Light) (SL).tmTheme",
    "detect_indentation": false,
    "ensure_newline_at_eof_on_save": true,
    "fade_fold_buttons": false,
    "font_face": "Fira Code",
    "font_size": 17.0,
    "highlight_line": true,
    "highlight_modified_tabs": true,
    "ignored_packages":
    [
        "Vintage"
    ],
    "indent_guide_options":
    [
        "draw_active"
    ],
    "indent_to_bracket": true,
    "keys":
    [
        "ctrl+i"
    ],
    "overlay_scroll_bars": "enabled",
    "rulers":
    [
        120
    ],
    "tab_size": 2,
    "theme": "Seti_orig.sublime-theme",
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true,
    "word_wrap": false
}

``` 

You can see I set my default tab size to 2. There are helpful settings that make it easier to keep up with the code on our files, feel free to explore.

### Plugins

In Sublime, plugins are called packages. Some packages I use are:

#### - ERB Autocomplete

 - Allows keyboard shortcuts that autocomplete into erb tags to make me a little faster with rails.

#### - All Autocomplete
 - Finds words in al files in my project that may match what I'm currently typing to atuocomplete.

#### - SideBarEnhancements
 - Gives me more power over my files and folders in my sidebar.

Feel free to explore packages/plugins that appeal to you.
___

### Keeping your code clean

It doesn't matter what language you're writing your code in, it's pretty much **mandatory** to keep proper indentation and spacing. Improper indentation and spacing is an indicator of someone that doesn't have much experience with code. For this sloppy code session, we will be looking at keeping your ruby code clean.  


- Indentation

```ruby
    # BAD


    i = 0
    while i<10
    if i.odd?
    p i
    end
    end




    # GOOD

    i = 0

    while i < 10
      if i.odd?
        p i
      end
    end
```

______

- Spacing

When you have a one line code block, it's best to leave one space between the curly braces `{}` and the code. It's different when dealing with array. With arrays, there should be **no** space after the opening square bracket `[` or before the closing square bracket `]`.

```ruby
  # BAD

  users.map {|user| user.lowercase}

  # GOOD

  users.map { |user| user.lowercase }

```

```ruby
  # BAD

    [ "item", "element", "thing" ]

  # GOOD 

    ["item", "element", "thing"]
```

______

- Variables

With variables it's important to be descriptive. Avoid one letter variables unless it's absolutely obvious and clear as to what the variable represents.

```ruby
  c = ["jon", "dany", "aria", "sansa"]
  n = [1, 2, 3, 4, 5]

  # BAD
  c.each do |i|
    n.each do |j|
      puts "#{i} counts: #{j}"
    end
  end


  # GOOD

  characters.each do |character|
    numbers.each do |number|
      puts "#{character} now counts number: #{number}"
    end
  end

```

______

- Arrays

When creating arrays feel free to use whitespace `%w` formatting unless explicitly necessary to use literal strings. Also, if you are creating an array or just dealing with strings, it's preffered to use double-quotes `""` instead of single-quotes `''`. Everything that works with single-quotes will work with double-quotes, but it's not the same the other way around. 

```ruby
  # OK

  users = ["tom", "bill", "jim"]

  # PREFFERED

  users = %w(tom bill jim)
```

______

- Conditionals

  Case statements should have their `when`s indented at the same level.

```ruby
  #BAD

  case condition
    when "a"
      puts "it's a"
    when "b"
      puts "it's b"
    when "c"
      puts "it's c"
    else
      puts "it's none"
  end


  #GOOD

  case condition
  when "a"
    puts "it's a"
  when "b"
    puts "it's b"
  when "c"
    puts "it's c" 
  else
    puts "it's none"
  end


```

______


### Style Guides

At some point during your career you may find yourself coding in a language unfamiliar to you. How do yo know what guidelines to follow? Is it ok for me to use parenthesis or not? Luckily, software is old enough for people to already have prepared answers to these questions. They are commonly reffered to as a style guide. A style guide simply a set of standards for the writing and design of files. A style guide establishes and enforces style to improve communication.

##### Ruby style guide:
- https://github.com/github/rubocop-github/blob/master/STYLEGUIDE.md



##### Thoughtbot style guides:

Thoughtbot has created styles for a lot of the languages they used. For example, Ruby, JavaScript, Python, Swift, and Rails.

 - https://github.com/thoughtbot/guides/tree/master/style


___

### Refactoring

- When checking to see if an object matches a string. if you find yourself writing the same statement with an operator, refactor to check with include instead.

```ruby

# BAD

def replied_yes?
    response = "yes"
    response == "yes" || response == "yea" || response == "ye" || response == "y"
end

# GOOD

def replied_yes?
    response = "yes"
    %w(yes yea ye ya y).include? response
end
```

- When you find yourself assigning a variable in a method, it's a good idea to abstract it to another method of it's own.

```ruby

# BAD
def add_number_to_array
    numbers = [12, 34, 76, 543, 23, 44]

    numbers += 4
end

# GOOD
def add_number_to_array
    numbers += 4
end

def numbers
    [12, 34, 76, 543, 23, 44]
end

```










