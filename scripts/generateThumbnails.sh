
dir=$PWD
find . -type d -mindepth 1 -prune -o -path '*/.thumbnails' | while read d; do
	cd $d/ 
	$dir/scripts/_generateThumbnails.sh $dir 
	cd $dir
done


