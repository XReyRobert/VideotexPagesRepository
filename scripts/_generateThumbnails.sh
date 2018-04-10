#generate README.md for all E.* files in CURRRENT directory (invoked by directory parsing script)
#getting the rootpath as an argument for proper url generation 

rel=${PWD//$1/}

repoUrl=https://raw.githubusercontent.com/xavrr/test/master/
directory=${PWD##*/}

if ls E.* 1> /dev/null 2>&1; then
    rm -fr .thumbnails >> /dev/null
    mkdir .thumbnails
fi

loaderUrl="http://212.47.238.202/minitel/minitel-loader.html?url="
if [ -f README.md ]; then
	rm README.md >> /dev/null
fi

mycmd="echo [{}]($loaderUrl"
imgtag="<img src=\"$repoUrl$rel/thumbnails/{}.png\" width=\"300\">"

find . -name 'E.*' -maxdepth 1 | sed 's|^./||' |  xargs -I{} node $1/scripts/_minitel_screenshot.js $repoUrl$rel/{} $PWD/.thumbnails/{}.png
