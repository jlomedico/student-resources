Code snippets Command Line

```bash
/Applications/Safari.app/Contents/MacOS/Safari
```

```bash
echo 'Hello world!'

```

```bash
ech<tab>

becomes

echo

```

```bash
e<tab><tab>

```

```bash
man echo


man man
man top
man purge

```

```bash
echo
echo 'Hello world!'
echo 'Hello' 'World!'
echo -n 'Hello world!'
echo -n 'Hello' 'world!'

```

```bash
pwd
whoami
```

```bash
mkdir

mkdir -p code/1/2/3

```

```bash
cd code
cd ..
```

```bash
rmdir 1

rmdir -p 1/2/3

```

```bash
touch some_code
touch some_more_code

ls
ls -a -l
ls -al

```

```bash
cp some_code some_code_backup

mkdir a
cp -r a b

```

```bash
mkdir -p 1/2/3

mkdir without_slash
cp -r 1 without_slash

mkdir with_slash
cp -r 1/ with_slash

```

```bash
ls -R

find .

```

```bash
mv some_more_code some_other_code

mv 1 a

```

```bash
rm some_code_backup

rm a
rm -r a

```

```bash
echo 'Hello world!' > hello_world.txt

cat hello_world.txt
Hello world!



```

```bash
echo 'Hello world!' > hello_world.txt
echo 'Hello world!' >> hello_world.txt

cat hello_world.txt
```

```bash
find . >> hello_world.txt

cat hello_world.txt


```


```bash
less hello_world.txt

man less

```

```bash
cat hello_world.txt | head

cat hello_world.txt | tail

yes | head

```


```bash
head hello_world.txt

tail hello_world.txt


```

```bash
cat hello_world.txt | head
head < hello_world.txt

cat hello_world.txt | tail
tail < hello_world.txt


```


```bash
ls
ls some*
ls *code
ls *s*

```

```bash
HELLO="World"
echo $HELLO

set
set | grep HELLO

```


```bash
HELLO="World"
export HELLO
echo $HELLO

env
env | grep HELLO
set | grep HELLO

```

```bash
export HELLO=”World”

unset HELLO

```


```bash
exit
logout

```

```bash
chown
chgrp
chmod

```


```bash
echo puts \"Hello world\!\" | ruby

ruby -e "puts \"Hello world\!\""

ruby hello_world.rb


```


```bash
ruby -v

ruby --version

```


```bash
ruby -h

ruby --help

```
