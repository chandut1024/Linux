#sudo ssh -i chandu_t.pem chandu_t@34.255.54.71
#mkdir /apps/datafiles_1/PM/TESTDATA/ETLFiles/BasicETL/201912070832/
echo '################## Input Parameters ####################'
read -p 'Enter Source File name:' Src_File
read -p 'Enter Destination Folder Path:' Dst_Path
sudo scp -i chandu_t.pem $Src_File chandu_t@34.255.54.71:$Dst_Path
