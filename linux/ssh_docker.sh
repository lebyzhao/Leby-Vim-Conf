
if [ $# != 1 ]; then
	echo "error: no input ip"
	exit
fi

echo "Connect docker server..."
ARG=$1
IP=""

case  "$ARG"  in

	 *)
	 IP=$ARG
	 ;;
esac

echo ">>>> conn for [$ARG] name to [$IP]"

#USER=tt
#PWD=cftXian029

PORT=22
USER=root
PWD=sorry

expect ~/tools/ssh_expect.exp $IP $PORT $USER $PWD

