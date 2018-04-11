
dir=$PWD
find . -type d \( -name .git -o -name .thumbnails \) -prune -o -type d -print | while read d; do
	echo "------------------------------------"
	cd $d/
	echo $d 
	$dir/scripts/_generateThumbnails.sh $dir 
	cd $dir
done

git add --all
git commit -m -a 'Autogeration of thumbnails'
git push

