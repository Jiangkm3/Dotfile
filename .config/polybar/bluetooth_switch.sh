if [ $status == "active" ]
then
	systemctl stop bluetooth.service
else 
	systemctl start bluetooth.service
fi
