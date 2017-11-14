
```bash
gem command
man gem
gem subcommands
SYNOPSIS
     gem command [arguments...] [options...]

list
gem list

gem list --remote
install / uninstall
gem install activesupport

gem uninstall activesupport
```
```bash
ActiveSupport
Launch irb like this:

irb -r"active_support/all"

You can also require it in your irb session or in a Ruby file:

require "active_support/all"

blank?
"".blank?
nil.blank?
false.blank?
{}.blank? # Hash.new.blank?
[].blank?
time math
1.hour.ago
1.hour.from_now


(1.week + 1.hour).ago
(1.week - 1.hour).from_now

p (1.week + 1.hour)
7 days and 3600 seconds
```
```bash

Open Classes
class String
  def monkey?
    self.eql? "monkey"
  end
end
Open Classes
puts "".monkey?
puts "monkey".monkey?
```
```bash
Monkeying Around
class String
  def +(other_string)
    self.to_i + other_string.to_i
  end
end
```
```bash
Monkeying Around
puts "1" + "2"
This is now 3 (Fixnum)

puts "a" + "b"
This is now 0 (Fixnum)
```