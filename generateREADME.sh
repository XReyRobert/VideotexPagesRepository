#generate README.md for all E.* files in CURRRENT directory (invoked by directory parsing script)
#getting the rootpath as an argument for proper url generation 

rel=${PWD//$1/}

repoUr=https://raw.githubusercontent.com/xavrr/test/master/
directory=${PWD##*/}


loaderUrl="http://212.47.238.202/minitel/minitel-loader.html?url="
rm README.md

mycmd="echo [{}]($loaderUrl"

find . -name 'E.*' -maxdepth 1 | sed 's|^./||' | xargs -I{} echo [{}]\($loaderUrl$repoUrl$rel/{}\) >> README.md 

