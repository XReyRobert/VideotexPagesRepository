
dir=$PWD
find . -type d \( -name .git -o -name .thumbnails \) -prune -o -type d -print | while read d; do
	cd $d/
	echo -----------------------------
	echo $d 
	$dir/scripts/_generateREADME.sh $dir 
	cd $dir
done
echo

#git commit -m "autogenerate all README.md for videotex pages directories" */README.md
#git push


