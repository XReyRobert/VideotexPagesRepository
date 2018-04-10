#generate README.md for all E.* files in CURRRENT directory (invoked by directory parsing script)

repoUrl=https://raw.githubusercontent.com/xavrr/test/master/
directory=${PWD##*/}

loaderUrl="http://212.47.238.202/minitel/minitel-loader.html?url="
rm README.md

mycmd="echo [{}]($loaderUrl"

find . -name 'E.*' -maxdepth 1 | sed 's|^./||' | xargs -I{} echo [{}]\($loaderUrl$repoUrl$directory/{}\) >> README.md 

