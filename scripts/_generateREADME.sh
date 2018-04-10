#generate README.md for all E.* files in CURRRENT directory (invoked by directory parsing script)
#getting the rootpath as an argument for proper url generation 

rel=${PWD//$1/}
repoUrl=https://raw.githubusercontent.com/XReyRobert/VideotexPagesRepository/master/
directory=${PWD##*/}


loaderUrl="http://212.47.238.202/minitel/minitel-loader.html?url="
if [ -f README.md ]; then
	rm README.md >> /dev/null
fi

mycmd="echo [{}]($loaderUrl"
imgtag="<img src=\"$repoUrl$rel/thumbnails/{}.png\" width=\"300\">"
echo -n .
find . -name 'E.*' -maxdepth 1 | sed 's|^./||' | xargs -I{} echo [$imgtag]\($loaderUrl$repoUrl$rel/{}\)\<BR\> >> README.md 
