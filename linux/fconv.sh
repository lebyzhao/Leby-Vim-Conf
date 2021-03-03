if [ $# != 1 ]; then
    echo "usage:$0 op_type[1:check-all 2:Unrecognized enc 3:convert to gbk 4:convert to utf-8]"
    exit
fi

op_type=$1

tmp_file='/tmp/leby_enc.txt'
rm -f $tmp_file

find ./ -type f | xargs enca -L zh_CN  > $tmp_file

while read fline; do

	if [[ $op_type -eq "1" ]]; then
		echo $fline
	fi

	if [[ $op_type -eq "2" ]]; then
		if [[ "$fline" != "${fline/Unrecognized}" ]]; then
			echo $fline
		fi
	fi

	if [[ $op_type -eq "3" || $op_type -eq "4" ]]; then
		fname=`echo $fline | awk -F":" '{print $1}'`
		echo "---->|$fname|"

		check_crlf_cnt=`file $fname | grep -w 'CRLF' | wc -l`
		if [[ $check_crlf_cnt -eq "1" ]]; then
			echo "dos2unix [$fname]"
			dos2unix $fname
		fi 

		# if using utf-8
		if [[ "$fline" != "${fline/UTF-8}" ]]; then

			if [[ $op_type -eq "3" ]]; then
				echo "convert $fname from UTF-8 to GB2312..."
				
				iconv -f UTF-8 -t GBK $fname -o ./$fname".tmp"
				mv ./$fname".tmp" $fname
			fi

		elif [[ "$fline" != "${fline/GB2312}" ]]; then

			if [[ $op_type -eq "4" ]]; then
				echo "convert $fname from GB2312 to UTF8..."
				iconv -f GBK -t UTF-8 $fname -o ./$fname".tmp"
				mv ./$fname".tmp" $fname
			fi

		else
			if [[ "$fline" == "${fline/GB2312}" && "$fline" == "${fline/ASCII}" ]]; then
				echo "[$fname] conv failed, unknown enc: $fline"
			fi
		fi
	fi

done < $tmp_file
