#/bin/bash 

#generate README.md for all E.* files in CURRRENT directory (invoked by directory parsing script)
#getting the rootpath as an argument for proper url generation 

rel=${PWD//$1/}
repoUrl=https://raw.githubusercontent.com/XReyRobert/VideotexPagesRepository/master/
directory=${PWD##*/}

if [[ -n $(find . -name  'E.*' -o -name '*.vtx' -o -name '*.VTX' -o -name '*.VDT' -o -name '*.vdt' -maxdepth 1 -mmin -5) ]]
then
    rm -fr .thumbnails >> /dev/null
    mkdir .thumbnails
fi

imgtag="<img src=\"$repoUrl$rel/thumbnails/{}.png\" width=\"300\">"

find . -name 'E.*' -o -name '*.vtx' -o -name '*.VTX' -o -name '*.VDT' -o -name '*.vdt' -maxdepth 1 | sed 's|^./||' | xargs -I{} -P 20 node $1/scripts/_minitel_screenshot.js $repoUrl$rel/{} $PWD/.thumbnails/{}.png
find . -name 'E.*' -o -name '*.vtx' -o -name '*.VTX' -o -name '*.VDT' -o -name '*.vdt' -maxdepth 1 | sed 's|^./||' | xargs -I{} -P 20 node $1/scripts/_minitel_animated_gif.js $repoUrl$rel/{} $PWD/.thumbnails/{}.gif
