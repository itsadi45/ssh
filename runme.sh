sudo sh -c '[Unit]
 Description=/etc/rc.local Compatibility
 ConditionPathExists=/etc/rc.local

[Service]
 Type=forking
 ExecStart=/etc/rc.local start
 TimeoutSec=0
 StandardOutput=tty
 RemainAfterExit=yes
 SysVStartPriority=99

[Install]
 WantedBy=multi-user.target | sudo tee -a /etc/systemd/system/rc-local.service'
 
echo ":: Created rc-local.service in systemd"
printf '%s\n' '#!/bin/bash' 'exit 0' | sudo tee -a /etc/rc.local
echo ":: Created rc.local in /etc/"
sudo chmod +x /etc/rc.local
echo ":: Provided the permission for rc.local"
sudo systemctl enable rc-local
echo ":: Enabled rc-local using systemctl"


echo "\n:: Start Systemstl and Check the Status 
sudo systemctl start rc-local.service
sudo systemctl status rc-local.service

