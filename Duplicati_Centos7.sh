#!/bin/bash
yum -y install yum-utils
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
yum-config-manager --add-repo http://download.mono-project.com/repo/centos7/
yum -y install mono-devel
yum -y install epel-release
yum -y install libappindicator
#wget https://updates.duplicati.com/beta/duplicati-2.0.3.3-2.0.3.3_beta_20180402.noarch.rpm
yum -y install duplicati*

echo "[Unit]
Description=Duplicati Backup software
[Service]
ExecStart=/usr/bin/mono /usr/lib/duplicati/Duplicati.Server.exe --webservice-interface=any --webservice-port=8200
Restart=on-failure
RestartSec=30
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/duplicati.service


systemctl stop firewalld.service
systemctl enable duplicati.service
systemctl start duplicati.service

printf '\nAccess your Duplicati site : \n\n' \ && printf '\n http://localhost:8200/ \n\n'


