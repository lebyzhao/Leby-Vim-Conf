
flist='
./src/command/Unfreeze.cpp
./src/command/STWxUnfreezeTransAsync.cpp
./src/command/STPayWxSettleAsync.cpp
./src/command/STPayBToSAsync.cpp
./src/command/STPayBToMAsync.cpp
./src/command/STMediRefunderAsync.cpp
./src/command/STJudiUnfreezeTransAsync.cpp
./src/command/STFetchPostAsync.cpp
./src/command/STExtMediUltraAdjustAsync.cpp
./src/command/STExtMediAdjustAsync.cpp
./src/command/SaveSucc.cpp
./src/command/RefundWxSettleToC.cpp
./src/command/RefundWxSettle.cpp
./src/command/RefundSettleMAsyncST.cpp
./src/command/RefundMediAsyncST.cpp
./src/command/RefundHongBao.cpp
./src/command/Refund4SToB.cpp
./src/command/Refund3MToB.cpp
./src/command/Refund2SToM.cpp
./src/command/Refund1MToRefunderST.cpp
./src/command/PayWxSettle.cpp
./src/command/PayHongBao.cpp
./src/command/PayBToMSaveAsync.cpp
./src/command/Pay32MToS.cpp
./src/command/Pay31MToS.cpp
./src/command/Pay23BToMAsync.cpp
./src/command/Pay22BToM.cpp
./src/command/Pay21BToM.cpp
./src/command/Pay1BToS.cpp
./src/command/FreezeTransferSucc.cpp
./src/command/FreezeTransferFail.cpp
./src/command/FreezeTransfer.cpp
./src/command/Freeze.cpp
./src/command/FetchSucc.cpp
./src/command/FetchSign4.cpp
./src/command/FetchFail.cpp
./src/command/FetchDirectSucc.cpp
./src/command/Fetch.cpp
./src/command/FetchCancel.cpp
./src/command/FaHongBao.cpp
./src/command/ChaiHongBao.cpp
./src/command/AddFreezeList.cpp'

for fsrc in $flist; do 
  echo $fsrc
done
