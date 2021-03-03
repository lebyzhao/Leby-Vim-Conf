
svn_bran_path='/home/lebyzhao/svn/Tenpay3.0_proj/branches/'
proj_path='/home/lebyzhao/Tenpay3.0_proj/trunk/'
git_path='/home/lebyzhao/git/'

svc_path='/data/services/'

latest_ts_branch=`ls ${svn_bran_path} | grep trans_server_V | sort -nr | head -n 1`
latest_cs_branch=`ls ${svn_bran_path} | grep check_server_V | grep -v foreign_check_server | sort -nr | head -n 1`
latest_tsapi_branch=`ls ${svn_bran_path} | grep transapi_V | sort -nr | head -n 1`

latest_rp_branch=`ls ${svn_bran_path} | grep rlog_proxy_V | sort -nr | head -n 1`
latest_tp_branch=`ls ${svn_bran_path} | grep trans_proxy_V | sort -nr | head -n 1`

latest_fts_branch=`ls ${svn_bran_path} | grep foreign_trans_server_V | sort -nr | head -n 1`
latest_fcs_branch=`ls ${svn_bran_path} | grep foreign_check_server_V | sort -nr | head -n 1`

go_dir=$1

case  "$go_dir"  in

  "ts"  )
    cd ${git_path}/trans_server/
    ;;

  "ft"  )
    cd ${git_path}/ftrans_ao/
    ;;

  "frp"  )
    cd ${git_path}/frlog_proxy_ao/
    ;;


  "tsapi"  )
    cd ${git_path}/transapi/
    ;;

  "cs"  )
    cd ${proj_path}/check_server/
    ;;

  "fts"  )
    cd ${proj_path}/accnt_trans_server/
    ;;

  "fcs"  )
    cd ${proj_path}/accnt_check_server/
    ;;

  "rp"  )
    cd ${git_path}/rlog_proxy/
    ;;

  "tp"  )
    cd ${git_path}/trans_proxy/
    ;;

  "slts" )
    cd ${svn_bran_path}/${latest_ts_branch}/trans_server/
    ;;

  "sltp" )
    cd ${svn_bran_path}/${latest_tp_branch}/trans_proxy/
    ;;

  "slcs" )
    cd ${svn_bran_path}/${latest_cs_branch}/check_server/
    ;;

  "fslts" )
    cd ${svn_bran_path}/${latest_fts_branch}/accnt_trans_server/
    ;;

  "fslcs" )
    cd ${svn_bran_path}/${latest_fcs_branch}/accnt_check_server/
    ;;

  "slrp" )
    cd ${svn_bran_path}/${latest_rp_branch}/rlog_proxy/
    ;;

  "sltsapi" )
    cd ${svn_bran_path}/${latest_tsapi_branch}/transapi/
    ;;

  "sts" )
    cd ${svc_path}/transSrv/admin/
    ;;

  "stp" )
    cd ${svc_path}/trans_proxy/admin/
    ;;

  "scs" )
    cd ${svc_path}/coreCheckSrv/admin/
    ;;

  "fsts" )
    cd ${svc_path}/accnt_trans_server/admin/
    ;;

  "fscs" )
    cd ${svc_path}/accnt_check_server/admin/
    ;;

  "srp" )
    cd ${svc_path}/rlog_proxy/admin/
    ;;

  "doc" )
    cd ${svc_path}/coreCheckSrv/admin/
    ;;


  *)
    echo "invalid subdir"
    ;;

  esac
