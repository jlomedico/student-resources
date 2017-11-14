This should be run in general as part of the pre-work.

```bash
xcode-select --install
```

If it's "already installed", great!


Sometimes a straight install works if you’ve got XCode Command Line Tools.

```bash
gem install nokogiri
```

Sometimes Rails knows how to install Nokogiri better than Nokogiri itself:

```bash
gem install rails
```

If you see complaints about “missing libiconv” or something, then try this:

```bash
gem install nokogiri -- --use-system-libraries
```

That worked for me on OSX 10.10 (Yosemite).


If it still complains, then do this:

```bash
brew tap homebrew/dupes
```

and

```bash
brew install libiconv libxml2
```

Then try some of these:

```bash
gem install nokogiri -- --use-system-libraries --with-iconv-dir="$(brew --prefix libiconv)" --with-xml2-dir="$(brew --prefix libxml2)"
```

```bash
gem install nokogiri -- --use-system-libraries --with-iconv-dir=/usr/local/Cellar/libiconv/1.14/ --with-xml2-dir=/usr/local/Cellar/libxml2/
```

```bash
gem install nokogiri -- --use-system-libraries --with-iconv-include=/usr/local/opt/lib/libiconv/include/ --with-xml2-include=/usr/local/opt/libxml2/include/libxml2/
```
______
#### Other advice:
http://www.nokogiri.org/tutorials/installing_nokogiri.html 

