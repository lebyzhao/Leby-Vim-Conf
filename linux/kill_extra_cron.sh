cnt=`ps -ef | grep -w crond | grep -v grep | wc -l`

if [[ "$cnt" -gt "1" ]]; then
	echo "need to kill... $cnt"
	pid=`ps -ef | grep cron | grep -v grep | head -n 1 | awk '{print $2}'`
	sudo kill -9 $pid
	exit
fi

echo "ignored kill cron $cnt"
