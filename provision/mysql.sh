#!/bin/bash
echo " "
echo "-----------------------------------------------------------------------------"
echo "Provisioning MySQL..."
echo "-----------------------------------------------------------------------------"
echo " "
echo "[1/4] --== Preparing MySQL Install ==--"
apt-get install debconf-utils -y >> /vagrant/log/provision_mysql.log 2>&1

echo "[2/4] --== Installing MySQL ==--"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $1"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $1"
apt-get -y install mysql-server -y >> /vagrant/log/provision_mysql.log 2>&1

echo "[3/4] --== Installing PHPMyAdmin ==--"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $1"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $1"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $1"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"
apt-get install phpmyadmin -y >> /vagrant/log/provision_mysql.log 2>&1

echo "[4/4] --== Installing PHP MySQL Extension ==--"
apt-get install php-mysql -y >> /vagrant/log/provision_mysql.log 2>&1