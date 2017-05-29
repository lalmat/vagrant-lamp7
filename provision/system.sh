#!/bin/bash
echo "  _________              ___ ___        _________         "
echo " /   _____/ ____ ___.__./   |   \ __ __ \_   ___ \  ____  "
echo " \_____  \ /  _ <   |  /    ~    \  |  \/    \  \/_/ __ \ "
echo " /        (  <_> )___  \    Y    /  |  /\     \___\  ___/ "
echo "/_______  /\____// ____|\___|_  /|____/  \______  /\___  >"
echo "        \/       \/           \/                \/     \/ "
echo ".____       _____      _____  __________  _________   ____ "
echo "|    |     /  _  \    /     \ \______   \ \______  \ /_   |"
echo "|    |    /  /_\  \  /  \ /  \ |     ___/     /    /  |   |"
echo "|    |___/    |    \/    Y    \|    |        /    /   |   |"
echo "|_______ \____|__  /\____|__  /|____|       /____/ /\ |___|"
echo "        \/       \/         \/                    \/      "
echo " "
echo "-----------------------------------------------------------------------------"
echo "Provisioning System tools..."
echo "-----------------------------------------------------------------------------"
echo " "
echo "[1/6] --== Updating Box Image ==--"
apt-get update >> /vagrant/log/provision_system.log 2>&1

echo "[2/6] --== Upgrading Box Image ==--"
apt-get upgrade -y >> /vagrant/log/provision_system.log 2>&1

echo "[3/6] --== Installing Language Pack ==--"
apt-get install language-pack-fr -y >> /vagrant/log/provision_system.log 2>&1

echo "[4/6] --== Essential System Tools ==--"
apt-get install -y python-software-properties build-essential >> /vagrant/log/provision_system.log 2>&1

echo "[4/6] --== Installing Git ==--"
apt-get install git -y >> /vagrant/log/provision_system.log 2>&1

echo "[5/6] --== Installing Curl ==--"
apt-get install curl -y >> /vagrant/log/provision_system.log 2>&1

echo "[6/6] --== Installing NodeJS/NPM ==--"
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs >> /vagrant/log/provision_system.log 2>&1