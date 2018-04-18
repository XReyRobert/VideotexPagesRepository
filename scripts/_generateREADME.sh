#!/bin/bash
#generate README.md for all E.* files in CURRRENT directory (invoked by directory parsing script)
#getting the rootpath as an argument for proper url generation 

rel=${PWD//$1/}
repoUrl=https://raw.githubusercontent.com/XReyRobert/VideotexPagesRepository/master/
directory=${PWD##*/}

loaderUrl="http://www.lideal.com/miedit/minitel-loader.html?url="
urlpath=$repoUrl$rel/.thumbnails/{}.png

# if any E. file is present in directory then generate the README.md
if ls E.* 1> /dev/null 2>&1; then
	if [ -f README.md ]; then
		rm README.md >> /dev/null
	fi
mycmd="echo [{}]($loaderUrl"
imgtag="<img src=\"$repoUrl$rel/.thumbnails/{}.png\" width=\"300\">"
echo -n

#replace all spaces in filenames by _  to avoid issue in generated htm 

if ls E.*\ * 1> /dev/null 2>&1; then
   for f in E.*\ *; do mv "$f" "${f// /_}"; done
fi
echo "### Click on image thumbnail to see it in its full **Videotex** glory" >> README.md
echo "" >> README.md

find . -name 'E.*' -maxdepth 1 | sed 's|^./||' | xargs -I{} echo [$imgtag]\($loaderUrl$repoUrl$rel/{}\) | cat - >> README.md
fi

