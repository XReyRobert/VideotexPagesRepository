
dir=$PWD
find . -type d -mindepth 1 | while read d; do
	cd $d/ 
	$dir/_generateREADME.sh $dir 
	cd $dir
done

