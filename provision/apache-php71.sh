#!/bin/bash
echo " "
echo "-----------------------------------------------------------------------------"
echo "Provisioning Apache & PHP"
echo "-----------------------------------------------------------------------------"
echo " "
echo "[1/5] --== Updating PHP repository ==--"
add-apt-repository ppa:ondrej/php -y >> /vagrant/log/provision_apache-php.log 2>&1
apt-get update -y >> /vagrant/log/provision_apache-php.log 2>&1

echo "[2/5] --== Installing Apache 2, PHP ==--"
apt-get install -y apache2 php7.1 libapache2-mod-php >> /vagrant/log/provision_apache-php.log 2>&1

echo "[3/5] --== Installing PHP Extensions ==--"
apt-get install -y php-curl >> /vagrant/log/provision_apache-php.log 2>&1
apt-get install -y php-gd >> /vagrant/log/provision_apache-php.log 2>&1
apt-get install -y php-gettext >> /vagrant/log/provision_apache-php.log 2>&1
apt-get install -y php-xdebug >> /vagrant/log/provision_apache-php.log 2>&1
#apt-get install -y php-bcmath >> /vagrant/log/provision_apache-php.log 2>&1

echo "[4/5] --== Enabling Apache2 Modules ==--"
a2enmod rewrite >> /vagrant/log/provision_apache-php.log 2>&1
a2enmod vhost_alias >> /vagrant/log/provision_apache-php.log 2>&1
cp /vagrant/provision/vhost_alias.conf /etc/apache2/conf-enabled/ -f >> /vagrant/log/provision_apache-php.log 2>&1
cp /vagrant/provision/xdebug.ini /etc/php/7.1/mods-available/xdebug.ini -f >> /vagrant/log/provision_apache-php.log 2>&1
service apache2 restart >> /vagrant/log/provision_apache-php.log 2>&1

echo "[5/5] --== Installing PHP Composer ==--"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
