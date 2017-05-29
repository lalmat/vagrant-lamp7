require 'yaml'

# Loading external Configuration
cfg = YAML.load_file 'config.yml'

# Configuring the Box
Vagrant.configure("2") do |config|

  # Using Ubuntu 16.04 LTS
  config.vm.box = "ubuntu/xenial64"

  # Configuring Network
  config.vm.network :forwarded_port, guest: cfg['ports']['guest'], host: cfg['ports']['host'], auto_correct: true
  config.vm.synced_folder cfg['files']['host'], cfg['files']['guest'], create: true, group: cfg['files']['group'], owner: cfg['files']['user']

  # Configure Box Ressources
  config.vm.provider "virtualbox" do |v|
    v.name = cfg['vm']['name']
    v.customize ["modifyvm", :id, "--memory", cfg['vm']['memory']]
  end
  
  # Provisioning System
  config.vm.provision "system",
    type: "shell",
    preserve_order: true,
    path: "provision/system.sh"

  # Provisioning Apache & PHP 7
  config.vm.provision "apache-php71",
    type: "shell",
    preserve_order: true,
    path: "provision/apache-php71.sh"

  # Provisioning MySQL
  config.vm.provision "mysql",
    type: "shell",
    preserve_order: true,
    path: "provision/mysql.sh",
    args: cfg['db']['password']
  
end