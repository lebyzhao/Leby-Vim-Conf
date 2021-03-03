
left_file=$1
right_file=$2

# get the key words from $left_file
while read line_content; do

	# only handle for the special line_content
	line_key="[CBaseProcess::Begin|CBaseSingleTrans::Begin]"
	result=$(echo $line_content | egrep "$line_key")

	if [[ "$result" == "" ]]; then
		continue
	fi

	# for the key line_content
	line_data=$(echo $line_content | awk '{print $3}')

	# check the right file if contains the line_data
	cnt=$(grep $line_data $right_file  | wc -l)
	if [[ $cnt == 0 ]]; then
		echo "$right_file not contain [$line_data] [$line_content]"
	fi

done < $left_file

