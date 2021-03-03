
MAKE_DIR=$1
CUR_PATH=`pwd`

if [ -z $MAKE_DIR ]; then
  MAKE_DIR="."
fi

if [[ ! -f $MAKE_DIR/makefile && ! -f $MAKE_DIR/Makefile ]]; then
  echo "path:$MAKE_DIR has no makefile/Makefile!"
  exit
fi

cd $MAKE_DIR

## 这个必须和指定的项目gcc编译版本一致
## bear -v make clean
## bear -v make
#bear --use-c++ '/usr/bin/g++44' -v make clean
#bear --use-c++ '/usr/bin/g++44' -v make >/tmp/mk.log

bear -v make clean
bear -v make >/tmp/mk.log

#mv -f compile_commands.json $MAKE_DIR
touch -f .projectile

# to confirm
ls -l compile_commands.json
mv -f compile_commands.json compile_commands.json.new

echo -ne "\n>>> check bin:\n"
test -d ./bin && tree ./bin
test -d ../bin && tree ../bin


echo "will update [compile_commands.json in 5 second..."
sleep 5
mv -f compile_commands.json.new  $CUR_PATH/compile_commands.json 
ls -l $CUR_PATH/compile_commands.json
echo -ne "\n>>> all done.\n"
date


# post actions
#while true; do
#  read -p "Update compile_commands.json [y/n]?" yn
#  echo " "
#  echo " "
#  echo " "
#  case $yn in
#    [Yy]* ) 
#      mv -f compile_commands.json.new  $CUR_PATH/compile_commands.json 
#      echo "done!"
#      break;;
#    [Nn]* ) 
#      exit;;
#    * ) 
#      echo "Please answer y or n.";;
#  esac
#done
