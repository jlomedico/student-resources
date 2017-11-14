## Windows 10 Subsystem for Linux
### otherwise known as WSL

Things are a bit different on Windows.

## General

* `win + ctrl + d`: New desktop
* `win + ctrl + arrow keys`: switch between desktops
* `win + ctrl + f4`: close a desktop
* `win + arrow keys`: Moves active window to the left or right of the screen allowing to split your windows.

## Powershell

Powershell has no copy/paste shortcut keys, but if you highlight something in it and right click, that copies.
Then you can paste in the input with right click. You can also paste anything else copied from other sources, using right click.There's also no tabbed windows.

* `cd`: alias for change directory
* `ls`: alias for listing directories and files
* `rm`: alias for removing a file or directory
* `mv`: alias for moving a file or directory

Powershell uses, what are called, `cmdlets` so `ls` and the rest are not an exact replica of the equivalent Linux/Unix commands.

I recommend getting ConEmu, a console emulator with tabbed windows and shortcut keys work. You can also fully customize it to your liking.

## ConEmu

* `ctrl + c`: Copy
* `ctrl + v`: paste
* `win + w`: Open a new tab
* `win + alt + del`: Close a tab
* `ctrl + tab`: Switch between tabs

In any terminal you can load up bash by simply typing `bash` in the terminal prompt. After that, all linux commands for the command line will apply.

Note: When first entering `bash`, your directory will be set to `/mnt/$HARDDRIVE/Users/$USERNAME` where `$HARDRIVE` is your harddrive name and `$USERNAME` is your login name on Windows. This is your home directory on Windows but if you `cd ~`, then you will wind up in `/home/$USERNAME` which is your home directory on Linux.

If you stay in the Windows directories, you'll be able to open your editor straight from the terminal, otherwise it won't work. You can also open your editor from a terminal that is not `bash`.

Note 2: Environment variables in Windows are referenced like this: `%PATH%` Whereas Linux Env vars are referenced like this: `$PATH`. Learn the differences.

## Trackpad

The trackpad's capabilities are determined by the hardware but the most common work almost exactly like the Ubuntu ones.

* one tap: serves as a click
* double tap and hold: allows to drag folders, files, windows, etc...
* two finger tap: this works as a secondary or right click.
* two finger scroll: allows to scroll windows

## Extras
For further Windows 10 fun! I suggest getting http://scoop.sh/ up and running, it is a command line package manager not unlike Homebrew on the Mac. This allows you to install various tools through the command line that you would normally have to go to their website and download individually.
