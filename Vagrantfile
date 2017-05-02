# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "first8/f8forum-base"
  
  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.33.10"
    
    master.vm.provider :virtualbox do |vb|
      vb.name = "controller"
    end
    master.vm.provision "ansible_local" do |ansible|
      ansible.playbook = 'bootstrap.yml'
      ansible.install_mode = 'pip'
      ansible.version = '2.2.2.0'
    end
  end
  
  config.vm.define "web" do |web|
    web.vm.network "private_network", ip: "192.168.33.20"
    
    web.vm.provider :virtualbox do |vb|
      vb.name = "web"
    end
    
    web.vm.network "forwarded_port", guest: 80, host: 8080
  end
  
  config.vm.define "database" do |database|
    database.vm.network "private_network", ip: "192.168.33.30"
    
    database.vm.provider :virtualbox do |vb|
      vb.name = "database"
    end
  end
	


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
 

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"


end
