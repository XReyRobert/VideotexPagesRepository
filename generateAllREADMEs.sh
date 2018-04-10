
dir=$PWD
find . -type d -mindepth 1 | while read d; do
	cd $d/ 
	$dir/generateREADME.sh
	cd $dir
done


