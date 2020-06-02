# duplicati
# 1.Install the pre-requistes
./packages.sh
# 2.Download duplicati
https://www.duplicati.com/download

wget https://updates.duplicati.com/beta/duplicati-2.0.5.1-2.0.5.1_beta_20200118.noarch.rpm
# 3.Install duplicati rpm
yum install duplicati*
# Add port 8200 to the firewall to make the duplicati web application work
firewall-cmd --add-port = 8200 / tcp --permanent

firewall-cmd --reload
