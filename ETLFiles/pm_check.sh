#!/bin/bash
current_time=$(date "+%Y%m%d_%H%M%S")
echo "###############       Input Parameters      ##############################"
read -p "Enter Application Name:" APP_Name
if [ "$APP_Name" == "ETL" ]
then
        read -p  "Enter DataStore Name:" DS_Name
fi
if [ "$APP_Name" == "ETL" ]
then
        read -p  "Enter FTP Location:" FTP_Location
fi
if [ "$APP_Name" == "ETL" ]
then
        echo "###############       FTP Location          ##############################"
        ls -ltr $FTP_Location
fi
echo "###############       $APP_Name Monitor            ##############################"
jps|grep $APP_Name
echo "###############       Logs Path             ##############################"
cat /apps/cmmgr/config/log4j.properties|grep 'log4j.appender.DEBUGFILE.file='
echo "###############       $APP_Name Debug Log          ##############################"
if [ "$APP_Name" == "ETL" ]
then
        echo "/apps/datafiles_1/logs/pmlogs/ETL/stpmcuk01a/debog.log"
elif [ "$APP_Name" == "Profile" ]
then
        echo "/apps/datafiles_1/pmgr_paradigm1/logs/PROFILESCHEDULER/218/debug.log"
else
        echo "/apps/datafiles_1/pmgr_paradigm1/logs/ADVQB/218/debug.log"
fi
echo "###############       $APP_Name DB Checks          ##############################"
if [ "$APP_Name" == "ETL" ]
then
	touch /apps/datafiles_1/testdata/TEST/ETL/$DS_Name_$current_time.txt
        echo "SELECT DS_TBL.DS_ID AS DataStoreID,LOG_TBL.LOG_ID_FK AS FeedID,DS_TBL.DS_NAME AS DataStoreName,LOAD_TBL.* FROM log_ds_map_load_logs LOAD_TBL
JOIN sdh_log_datastore_map LOG_TBL
ON LOAD_TBL.log_ds_map_id = LOG_TBL.LOG_ID_FK
JOIN sdh_datastores DS_TBL
ON  LOG_TBL.DS_ID_FK = DS_TBL.DS_ID
WHERE DS_TBL.DS_NAME = '$DS_Name';

SELECT DS_TBL.DS_ID AS DataStoreID,LOG_TBL.LOG_ID_FK AS FeedID,DS_TBL.DS_NAME AS DataStoreName,MAP_TBL.* FROM sdh_log_datastore_map LOG_TBL
JOIN sdh_datastores DS_TBL
ON  LOG_TBL.DS_ID_FK = DS_TBL.DS_ID
JOIN sdh_log_datastore_columns_map MAP_TBL
ON MAP_TBL.LOG_DS_MAP_ID_FK = LOG_TBL.LOG_ID_FK
WHERE DS_TBL.DS_NAME = '$DS_Name';" > /apps/datafiles_1/testdata/TEST/ETL/$DS_Name_$current_time.txt
	echo "/apps/datafiles_1/testdata/TEST/ETL/$DS_Name_$current_time.txt"
elif [ "$APP_Name" == "Profile" ]
then
        echo "/apps/datafiles_1/pmgr_paradigm1/logs/PROFILESCHEDULER/218/debug.log"
else
        echo "/apps/datafiles_1/pmgr_paradigm1/logs/ADVQB/218/debug.log"
fi

