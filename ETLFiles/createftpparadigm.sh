echo "                                      "
read -p "Do you want to create FTP Location:" Choice1
echo "                                      "
if [ "$Choice1" == "yes" ]
then
	read -p "Enter Folder Location:" Fol_Loc
	ssh 172.16.244.218 sudo mkdir $Fol_Loc
	ssh 172.16.244.218 sudo chmod 777 $Fol_Loc
	echo "                                      "
	echo "FTP Location $Fol_Loc has been created"
	echo "                                      "
fi
echo "Currently Running Applications"
echo "                                      "
ssh 172.16.244.218 sudo su - appuser -c jps
echo "                                      "
echo "Connecting... to 172.16.244.218"
echo "                                      "
ssh 172.16.244.218
