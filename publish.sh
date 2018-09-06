#!/usr/bin/env sh
git stash
git checkout master
hash=$(git rev-parse --short HEAD)
git checkout gh-pages
sed -i.bak -E "s/(\/\*<hash>\*\/\")([A-z0-9]{7})(\"\/\*<\/hash>\*\/\;)/\1$hash\3/g" index.html
rm index.html.bak
git add index.html
git commit -m "Update rawgit reference to $hash"
git push origin master
git checkout master
git stash pop
open "http://alexcu.github.io/resume"
