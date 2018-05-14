#/bin/bash 

#generate README.md for all E.* files in CURRRENT directory (invoked by directory parsing script)
#getting the rootpath as an argument for proper url generation 

rel=${PWD//$1/}
repoUrl=https://raw.githubusercontent.com/XReyRobert/VideotexPagesRepository/master/
directory=${PWD##*/}

if ls E.* 1> /dev/null 2>&1; then
    rm -fr .thumbnails >> /dev/null
    mkdir .thumbnails
fi

imgtag="<img src=\"$repoUrl$rel/thumbnails/{}.png\" width=\"300\">"

find . -name '*.vtx' -o -name 'E.*' -o '*.vtd' -maxdepth 1 | sed 's|^./||' | xargs -I{} -P 10 node $1/scripts/_minitel_screenshot.js $repoUrl$rel/{} $PWD/.thumbnails/{}.png
